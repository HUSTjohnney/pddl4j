package fr.uga.pddl4j.planners.htn;

import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.planners.PlannerConfiguration;
import fr.uga.pddl4j.planners.ProblemNotSupportedException;
import fr.uga.pddl4j.planners.htn.stn.AbstractSTNPlanner;
import fr.uga.pddl4j.problem.Problem;
import picocli.CommandLine;

/**
 * 自己写的TemporalHTN规划算法
 * 基于PDDL4j平台需要override三个Method，实例化过程（Instantiate），搜索过程（solve）和支持的问题类型（isSupported）三个方法重写。不懂的地方就先不管它。
 * Solves a temporal hierarchical planning problem using a Temporal hierarchical
 * task Decomposition strategy.
 */
public class THTN extends AbstractSTNPlanner {

    /**
     * Creates a new planner with a default configuration.
     */
    public THTN() {
        super();
    }

    /**
     * Creates a new abstract STN planner with the specfied configuration.
     *
     * @param configuration the configuration of the planner.
     */
    public THTN(final PlannerConfiguration configuration) {
        super(configuration);
    }

    @Override
    public Plan solve(Problem problem) throws ProblemNotSupportedException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'solve'");
    }

}
