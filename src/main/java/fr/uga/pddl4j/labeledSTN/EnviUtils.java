package fr.uga.pddl4j.labeledSTN;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

// Utils中定义了两个函数：Subsume和Union，分别表示环境的取代和融合。对应Def3.5和Def3.7 
public class EnviUtils {

    public static boolean subsumes(Map<String, Integer> e, Map<String, Integer> ePrime) {
        // 检查e中的每个键值对是否都能在ePrime中找到匹配
        for (Map.Entry<String, Integer> entry : e.entrySet()) {
            if (!ePrime.containsKey(entry.getKey()) || !ePrime.get(entry.getKey()).equals(entry.getValue())) {
                return false; // 如果e中有任何键值对在ePrime中找不到匹配，则e不被ePrime包含
            }
        }
        return true; // 如果e中的所有键值对都在ePrime中找到了匹配，那么e被ePrime包含
    }

    // 计算两个环境的联合
    public static Map<String, Integer> union(Map<String, Integer> e, Map<String, Integer> ePrime) {
        Map<String, Integer> result = new HashMap<>(e);
        for (Map.Entry<String, Integer> entry : ePrime.entrySet()) {
            // 如果e和e'为同一变量分配了不同的值，则返回⊥
            if (result.containsKey(entry.getKey()) && !result.get(entry.getKey()).equals(entry.getValue())) {
                return null; // 表示没有有效的联合
            }
            result.put(entry.getKey(), entry.getValue());
        }
        return result;
    }

    // f函数：labelValueSet的评价函数，最短路径以<=即可，对应Def 3.9
    public static boolean f(Integer a, Integer b) {
        // 实现逻辑，例如：如果a优先于b，返回true
        if (a <= b) {
            return true;
        }
        return false;
    }

    // 实现算法3.3
    static Set<Pair> LabeledBinaryOp(Set<Pair> A, Set<Pair> B, Conflict c) {
        Set<Pair> C = new HashSet<>();
        for (Pair ai : A) {
            for (Pair bj : B) {
                int cij = EnviUtils.g(ai.value, bj.value);
                Map<String, Integer> eij = union(ai.e, bj.e);
                if (!eij.isEmpty() && c.EnvironmentValid(eij)) {
                    C.add(new Pair(cij, eij));
                }
            }
        }
        return C;
    }

    private static int g(Integer value1, Integer value2) {
        return value1 + value2;
    }

    public static void main(String[] args) {
        Map<String, Integer> e = new HashMap<>();
        e.put("x", 1);
        e.put("y", 2);
        e.put("z", 1);

        Map<String, Integer> ePrime = new HashMap<>();
        ePrime.put("x", 1);
        ePrime.put("z", 1);

        Map<String, Integer> ea = new HashMap<>();
        ea.put("x", 1);
        ea.put("y", 2);

        System.out.println("e:" + e);
        System.out.println("ePrime:" + ePrime);
        System.out.println("anothere:" + ea);

        System.out.println("e subsumes ePrime? " + subsumes(e, ePrime)); // 应为false，因为e'不包含y=2

        System.out.println("anothere subsumes e?" + subsumes(ea, e)); // 应该为True

        System.out.println("e subsumes anotherEPrime? " + subsumes(e, ea)); // 应为false

        Map<String, Integer> unionResult = union(e, ePrime);
        if (unionResult != null) {
            System.out.println("Union of e and ePrime: " + unionResult);
        } else {
            System.out.println("Union is not valid.");
        }

        Map<String, Integer> conflictingEPrime = new HashMap<>();
        conflictingEPrime.put("x", 2); // 冲突的值

        Map<String, Integer> invalidUnionResult = union(e, conflictingEPrime);
        if (invalidUnionResult != null) {
            System.out.println("Union of e and conflictingEPrime: " + invalidUnionResult);
        } else {
            System.out.println("Union is not valid."); // 应打印这个
        }

    }
}