package fr.uga.pddl4j.labeledSTN;

public class TemporalConstraint {
    String constraint; // 节点和节点之间的约束关系
    String label; // 标签

    public TemporalConstraint(String constraint, String label) {
        this.constraint = constraint;
        this.label = label;
    }

    @Override
    public String toString() {
        return "Constraint: " + constraint + ", Label: " + label;
    }
}
