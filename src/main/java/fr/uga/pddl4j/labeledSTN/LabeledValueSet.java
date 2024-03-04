package fr.uga.pddl4j.labeledSTN;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class LabeledValueSet {

    // f函数：labelValueSet的评价函数，最短路径以<即可，对应Def 3.9
    private static boolean f(Integer a, Integer b) {
        // 实现逻辑，例如：如果a优先于b，返回true
        if (a <= b) {
            return true;
        }
        return false;
    }

    // 查询函数，查询ValueSet中
    

    // 添加函数，对于已有的标签值对A，添加一系列标签值对B
    public static List<Pair> addCandidateValues(List<Pair> A, List<Pair> B) {
        for (Pair b : B) { // Loop over new values
            boolean subsumed = false;
            for (Pair a : A) { // Test if new value is subsumed
                if (EnvironmentUtils.subsumes(a.e, b.e) && f(a.value, b.value)) {
                    subsumed = true;
                    break; // Continue to next value in B
                }
            }
            if (subsumed) {
                continue;
            }

            Iterator<Pair> iterator = A.iterator();
            while (iterator.hasNext()) {
                Pair a = iterator.next();
                if (EnvironmentUtils.subsumes(b.e, a.e) && f(b.value, a.value)) {
                    iterator.remove(); // Old value is subsumed, prune
                }
            }

            A.add(b); // Add new value
        }
        return A;
    }

    public static void main(String[] args) {
        // 示例使用
        List<Pair> A = new ArrayList<>();
        List<Pair> B = new ArrayList<>();
        // 填充A和B，调用addCandidateValues...
    }
}