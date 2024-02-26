package fr.uga.pddl4j.labeledSTN;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileProcessor {

    public static void main(String[] args) {
        String fileName = "D:\\git workspace\\pddl4j\\src\\main\\java\\fr\\uga\\pddl4j\\labeledSTN\\labeledstn.txt";
        List<TemporalConstraint> constraints = parseFile(fileName);
        for (TemporalConstraint tc : constraints) {
            System.out.println(tc);
        }
    }

    private static List<TemporalConstraint> parseFile(String fileName) {
        List<TemporalConstraint> constraints = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                // 处理每一行，可能包含多个{}约束
                String[] parts = line.split("\\}\\{");
                for (String part : parts) {
                    // 清理括号
                    String cleanPart = part.replaceAll("[{}]", "").trim();
                    if (!cleanPart.isEmpty()) {
                        // 分离约束和标签
                        String[] elements = cleanPart.split(", ");
                        String constraint = elements[0].trim();
                        String label = elements.length > 1 ? elements[1].trim() : null;
                        constraints.add(new TemporalConstraint(constraint, label));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return constraints;
    }
}