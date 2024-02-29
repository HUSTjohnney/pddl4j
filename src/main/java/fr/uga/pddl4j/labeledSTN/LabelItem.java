package fr.uga.pddl4j.labeledSTN;

public class LabelItem {
    private String variable;
    private String value;

    public String getVariable() {
        return variable;
    }

    public void setVariable(String variable) {
        this.variable = variable;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public LabelItem(String variable, String value) {
        this.variable = variable;
        this.value = value;
    }

    @Override
    public String toString() {
        return variable + "=" + value;
    }
}