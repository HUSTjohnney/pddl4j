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

package fr.uga.pddl4j.problem.operator;

import fr.uga.pddl4j.problem.time.SimpleTemporalNetwork;
import fr.uga.pddl4j.problem.time.TemporalTaskNetwork;

import java.util.List;

/**
 * This class implements a durative method. This class is used to store compact representation of a durative method.
 *
 * @author D. Pellier
 * @version 1.0 - 04.06.2022
 * @since 4.0
 */
public final class DurativeMethod extends AbstractDurativeOperator {

    /**
     * The default task index.
     */
    public static final int DEFAULT_TASK_INDEX = -1;

    /**
     * The task carries out by this method.
     */
    private int task;

    /**
     * The task network of the method.
     */
    private TemporalTaskNetwork taskNetwork;

    /**
     * Create a new method from a specified method. This constructor create a deep copy of the
     * specified method.
     *
     * @param other the other method.
     */
    public DurativeMethod(final DurativeMethod other) {
        super(other);
        this.task = other.getTask();
        this.taskNetwork = new TemporalTaskNetwork(other.taskNetwork);
    }

    /**
     * Create a new method with a specified name. The task is set to the DEFAULT_TASK_INDEX and the
     * task network is set to an empty task network with no orderings constraints.
     *
     * @param name  the name of the method.
     * @param arity the arity of the method. The arity cannot be less that 0.
     */
    public DurativeMethod(final String name, final int arity) {
        super(name, arity);
        this.task = Method.DEFAULT_TASK_INDEX;
        this.taskNetwork = new TemporalTaskNetwork();
    }

    /**
     * Return the task that is carried out by the method.
     *
     * @return the task carried out by the method.
     */
    public final int getTask() {
        return this.task;
    }

    /**
     * Set the task carried out by the method.
     *
     * @param task the task the carried out by the method.
     */
    public final void setTask(final int task) {
        this.task = task;
    }

    /**
     * Return the subtasks of the method.
     *
     * @return the subtasks of the method.
     */
    public final List<Integer> getSubTasks() {
        return this.taskNetwork.getTasks();
    }

    /**
     * Set the subtasks of the method.
     *
     * @param tasks the subtasks to set.
     */
    public final void setSubTasks(final List<Integer> tasks) {
        this.taskNetwork.setTasks(tasks);
    }

    /**
     * Return the ordering constraints of the method.
     *
     * @return the ordering constraints of the method.
     */
    public final SimpleTemporalNetwork getOrderingConstraints() {
        return this.taskNetwork.getOrderingConstraints();
    }

    /**
     * Set the new ordering constraints of the method.
     *
     * @param constraints the orderings constraints to set
     */
    public final void setOrderingConstraints(final SimpleTemporalNetwork constraints) {
        this.taskNetwork.setOrderingConstraints(constraints);
    }

    /**
     * Returns the task network of this method.
     *
     * @return the task network of this method.
     */
    public final TemporalTaskNetwork getTaskNetwork() {
        return this.taskNetwork;
    }

    /**
     * Set the task network of this method.
     *
     * @param taskNetwork the task network to set.
     */
    public final void setTaskNetwork(final TemporalTaskNetwork taskNetwork) {
        this.taskNetwork = taskNetwork;
    }
}
