package fr.uga.pddl4j.labeledSTN;

public class LabelItem {
    private String variable;
    private String value;

    public LabelItem(String variable, String value) {
        this.variable = variable;
        this.value = value;
    }

    @Override
    public String toString() {
        return variable + "=" + value;
    }
}