package fr.uga.pddl4j.labeledSTN;

public class LabelItem {
    String variable;
    String value;

    public LabelItem(String variable, String value) {
        this.variable = variable;
        this.value = value;
    }

    @Override
    public String toString() {
        return variable + "=" + value;
    }
}