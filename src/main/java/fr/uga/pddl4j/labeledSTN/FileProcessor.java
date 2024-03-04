// package fr.uga.pddl4j.labeledSTN;

// import java.io.BufferedReader;
// import java.io.FileReader;
// import java.io.IOException;
// import java.util.ArrayList;
// import java.util.List;

// public class FileProcessor {

// public static void main(String[] args) {
// String fileName = "D:\\git
// workspace\\pddl4j\\src\\main\\java\\fr\\uga\\pddl4j\\labeledSTN\\inputLabeledSTN.txt";
// List<LabeledTemporalConstraint> constraints = parseFile(fileName);
// for (LabeledTemporalConstraint tc : constraints) {
// System.out.println(tc);
// }
// }

// /*
// * 格式具有一定要求的，参考如下：
// * {T0.e-Z<1000, null}{T0.s-Z>0, null}
// * {T1.e<T2.s,null}{T1.e<T3.s,null}{T1.e-T4.s<0,null}{T5.e-T6.s<50,
// * null}{T6.e-T7.s<50, null}
// * {T5.e<T2.s, null}{T6.e<T2.s, null}{T7.e<T2.s, null}
// * {T8.e<T9.s, null}{T8.e>T9.s,null}
// * {T9.s-Z>0, null}{T8.e-T8.s<20, null}{T8.e-T8.s>20, null}{T9.e-T9.s<60,
// * null}{T9.e-T9.s>60, null}
// * {T8.s-Z>0, R_T8=ID1}{T8.e-Z<150, R_T8=ID1}
// * {T8.s-Z>650, R_T8=ID5}{T8.e-Z<800, R_T8=ID5}
// * {T8.s-Z>400, R_T8=ID4}{T8.e-Z<700, R_T8=ID4}
// * {T9.s-Z>0, R_T9=ID1}{T9.e-Z<150, R_T9=ID1}
// * {T8.s-Z>650, R_T9=ID5}{T9.e-Z<800, R_T9=ID5}
// * {T8.s-Z>400, R_T9=ID4}{T9.e-Z<700, R_T9=ID4}
// * {T8.e-T9.s<0, R_T9=ID1 R_T8=ID1 B_T8T9=1}
// * {T9.e-T8.s<0, R_T9=ID1 R_T8=ID1 B_T8T9=0}
// */

// private static List<LabeledTemporalConstraint> parseFile(String fileName) {
// List<LabeledTemporalConstraint> constraints = new ArrayList<>();
// try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
// String line;
// while ((line = br.readLine()) != null) {
// String[] parts = line.split("\\}\\{");
// for (String part : parts) {
// String cleanPart = part.replaceAll("[{}]", "").trim();
// if (!cleanPart.isEmpty()) {
// String[] elements = cleanPart.split(",");
// String constraint = elements[0].trim();
// String label = elements.length > 1 ? elements[1].trim() : null;
// // List<LabelItem> labellist = parseLabel(label);

// // 分割约束字符串以提取节点和可能的取值
// String[] constraintParts = constraint.split("[<>]");
// String node1 = constraintParts[0].trim();
// String node2 = constraintParts.length > 1 ? constraintParts[1].trim() : "";
// String value = "0"; // 默认取值

// // 检查是否有显式的取值，并提取
// if (node2.contains("-")) {
// String[] valueParts = node2.split("[-]", 2);
// node2 = valueParts[0].trim();
// value = valueParts[1].trim();
// }

// if (node1.contains("-")) {
// String[] valueParts = node1.split("[-]", 2);
// node1 = valueParts[0].trim();
// node2 = valueParts[1].trim();
// value = constraintParts[1].trim();
// }

// String operator = constraint.contains(">") ? ">" : "<";

// // 如果操作符是">"，则交换节点，并且处理取值
// if (">".equals(operator)) {
// String temp = node1;
// node1 = node2;
// node2 = temp;
// operator = "<";
// // 对取值进行处理，如果原先有取值，则取其相反数
// if (!"0".equals(value)) {
// value = "-" + value; // 取反
// }
// }

// // 确保取值正确处理，尤其是在操作符变更时
// if (!value.startsWith("-")) {
// value = "+" + value;
// }

// constraints.add(new LabeledTemporalConstraint(node1, node2, value, label));
// }
// }
// }
// } catch (IOException e) {
// e.printStackTrace();
// }
// return constraints;
// }

// }