/*
 * Copyright (c) 2010 by Damien Pellier <Damien.Pellier@imag.fr>.
 *
 * This file is part of PDDL4J library.
 *
 * PDDL4J is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PDDL4J is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with PDDL4J.  If not, see <http://www.gnu.org/licenses/>
 */

package fr.uga.pddl4j.planners.statespace.search.strategy;

import fr.uga.pddl4j.encoding.CodedProblem;
import fr.uga.pddl4j.heuristics.relaxation.Heuristic;
import fr.uga.pddl4j.heuristics.relaxation.HeuristicToolKit;
import fr.uga.pddl4j.planners.statespace.AbstractStateSpacePlanner;
import fr.uga.pddl4j.planners.statespace.StateSpacePlannerFactory;
import fr.uga.pddl4j.util.BitOp;
import fr.uga.pddl4j.util.BitState;
import fr.uga.pddl4j.util.MemoryAgent;
import fr.uga.pddl4j.util.Plan;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.Objects;

/**
 * This class implements Enforced Hill Climbing planner.
 *
 * @author Samuel Aaron Boyd
 * @author E. Hermellin
 * @version 2.0 - 24.01.2018
 */
public class EnforcedHillClimbing implements Serializable {

    /**
     * The serial id of the class.
     */
    private static final long serialVersionUID = 1L;

    /**
     * The time needed to search a solution node.
     */
    private static long searchingTime;

    /**
     * Creates a new planner.
     */
    private EnforcedHillClimbing() {
    }

    /**
     * Search a solution node to a specified domain and problem.
     *
     * @param planner the planner used to solve the problem
     * @param pb      the problem to solve.
     * @return the solution node.
     */
    public static Node searchSolutionNode(final AbstractStateSpacePlanner planner, final CodedProblem pb) {
        Objects.requireNonNull(pb);
        searchingTime = 0;
        return EnforcedHillClimbing.enforcedHillClimbing(planner, pb);
    }

    /**
     * Search a solution plan to a specified domain and problem.
     *
     * @param planner the planner used to solve the problem
     * @param pb      the problem to solve.
     * @return the solution plan or null.
     */
    public static Plan searchSolutionPlan(final AbstractStateSpacePlanner planner, final CodedProblem pb) {
        Objects.requireNonNull(pb);
        final Node solutionNode = EnforcedHillClimbing.enforcedHillClimbing(planner, pb);
        if (solutionNode != null) {
            return planner.extract(solutionNode, pb);
        } else {
            return null;
        }
    }

    /**
     * The enforced hill climbing algorithm. Solves the planning problem and returns the solution's node.
     *
     * @param planner the planner used to solve the problem
     * @param problem the coded problem to solve.
     * @return the solution node or null.
     */
    private static Node enforcedHillClimbing(final AbstractStateSpacePlanner planner, final CodedProblem problem) {
        final long begin = System.currentTimeMillis();
        final Heuristic heuristic = HeuristicToolKit.createHeuristic(planner.getHeuristicType(), problem);
        final LinkedList<Node> openList = new LinkedList<>();
        final int timeout = planner.getTimeout();

        BitState init = new BitState(problem.getInit());
        Node root = new Node(init, null, 0, 0, heuristic.estimate(init, problem.getGoal()));
        openList.add(root);

        double bestHeuristic = root.getHeuristic();

        Node solution = null;
        boolean deadEndFree = true;

        while (!openList.isEmpty() && solution == null && deadEndFree && searchingTime < timeout) {
            final Node currentState = openList.pop();
            final LinkedList<Node> successors = EnforcedHillClimbing.getSuccessors(currentState, problem, heuristic);
            deadEndFree = !successors.isEmpty();

            while (!successors.isEmpty() && solution == null) {
                final Node successor = successors.pop();
                final double heuristicSuccessor = successor.getHeuristic();
                if (heuristicSuccessor == 0.0) {
                    solution = successor;
                }
                if (heuristicSuccessor < bestHeuristic) {
                    successors.clear();
                    openList.clear();
                    bestHeuristic = heuristicSuccessor;
                }
                openList.addLast(successor);
            }

            // Take time to compute the searching time
            long end = System.currentTimeMillis();
            searchingTime = end - begin;
        }

        if (planner.isSaveState()) {
            // Compute the searching time
            planner.getStatistics().setTimeToSearch(searchingTime);
            if (StateSpacePlannerFactory.isMemoryAgent()) {
                // Compute the memory used by the search
                try {
                    planner.getStatistics().setMemoryUsedToSearch(MemoryAgent.deepSizeOf(openList)
                        + MemoryAgent.deepSizeOf(heuristic));
                } catch (IllegalStateException ilException) {
                    planner.getLogger().error(ilException);
                }
            }
        }

        return solution;
    }

    /**
     * Get the successors from a node.
     *
     * @param parent    the parent node.
     * @param problem   the coded problem to solve.
     * @param heuristic the heuristic used.
     * @return the list of successors from the parent node.
     */
    private static LinkedList<Node> getSuccessors(Node parent, CodedProblem problem, Heuristic heuristic) {
        final LinkedList<Node> successors = new LinkedList<>();

        int index = 0;
        for (BitOp op : problem.getOperators()) {
            // Test if a specified operator is applicable in the current state
            if (op.isApplicable(parent)) {
                final BitState nextState = new BitState(parent);
                nextState.or(op.getCondEffects().get(0).getEffects().getPositive());
                nextState.andNot(op.getCondEffects().get(0).getEffects().getNegative());

                // Apply the effect of the applicable operator
                final Node successor = new Node(nextState);
                successor.setCost(parent.getCost() + op.getCost());
                successor.setHeuristic(heuristic.estimate(nextState, problem.getGoal()));
                successor.setParent(parent);
                successor.setOperator(index);
                successor.setDepth(parent.getDepth() + 1);
                successors.add(successor);
            }
            index++;
        }

        return successors;
    }
}
