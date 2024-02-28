package fr.uga.pddl4j.labeledSTN;

import java.util.ArrayList;
import java.util.List;

public class LabeledTemporalConstraint {
    private String node1; // 节点1
    private String node2; // 节点2
    private String value; // 取值，如果有的话
    private List<LabelItem> label; // 标签

    public LabeledTemporalConstraint(String node1, String node2, String value, String label) {
        this.node1 = node1;
        this.node2 = node2;
        this.value = value;
        this.label = parseLabel(label);
    }

    @Override
    public String toString() {
        return "Node1: " + node1 + ", Node2: " + node2 + ", Operator: <= " +
                ", Value: " + value + ", Label: " + label;
    }

    // 解析Label
    private static List<LabelItem> parseLabel(String labelStr) {
        List<LabelItem> labelItems = new ArrayList<>();
        if (labelStr != null && !labelStr.isEmpty()) {
            // 用空格分开各部分
            String[] parts = labelStr.split(" ");
            for (String part : parts) {
                // 以等号再分开，得到变量和取值
                String[] keyValue = part.split("=");
                if (keyValue.length == 2) {
                    String variable = keyValue[0].trim();
                    String value = keyValue[1].trim();
                    LabelItem item = new LabelItem(variable, value);
                    labelItems.add(item);
                }
            }
        }
        return labelItems;
    }
}
