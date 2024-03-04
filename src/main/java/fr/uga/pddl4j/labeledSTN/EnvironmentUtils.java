package fr.uga.pddl4j.labeledSTN;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

// Utils中定义了两个函数：Subsume和Union，分别表示环境的取代和融合。对应Def3.5和Def3.7 
public class EnvironmentUtils {

    // 检查环境e是否包含环境e',实现逻辑，例如：如果a包含b，则返回true
    public static boolean subsumes(Map<String, Integer> e, Map<String, Integer> ePrime) {
        for (Map.Entry<String, Integer> entry : e.entrySet()) {
            if (!ePrime.containsKey(entry.getKey()) || !ePrime.get(entry.getKey()).equals(entry.getValue())) {
                return false;
            }
        }
        return true;
    }

    // 计算两个环境的联合
    public static Optional<Map<String, Integer>> union(Map<String, Integer> e, Map<String, Integer> ePrime) {
        Map<String, Integer> result = new HashMap<>(e);
        for (Map.Entry<String, Integer> entry : ePrime.entrySet()) {
            // 如果e和e'为同一变量分配了不同的值，则返回⊥
            if (result.containsKey(entry.getKey()) && !result.get(entry.getKey()).equals(entry.getValue())) {
                return Optional.empty(); // 表示没有有效的联合
            }
            result.put(entry.getKey(), entry.getValue());
        }
        return Optional.of(result);
    }

    public static void main(String[] args) {
        Map<String, Integer> e = new HashMap<>();
        e.put("x", 1);
        e.put("y", 2);
        e.put("z", 1);

        Map<String, Integer> ePrime = new HashMap<>();
        ePrime.put("x", 1);
        ePrime.put("z", 1);

        System.out.println("e subsumes ePrime? " + subsumes(e, ePrime)); // 应为false，因为e'不包含y=2

        Map<String, Integer> anotherEPrime = new HashMap<>();
        anotherEPrime.put("x", 1);
        anotherEPrime.put("y", 2);

        System.out.println("e subsumes anotherEPrime? " + subsumes(e, anotherEPrime)); // 应为true

        Optional<Map<String, Integer>> unionResult = union(e, ePrime);
        if (unionResult.isPresent()) {
            System.out.println("Union of e and ePrime: " + unionResult.get());
        } else {
            System.out.println("Union is not valid.");
        }

        Map<String, Integer> conflictingEPrime = new HashMap<>();
        conflictingEPrime.put("x", 2); // 冲突的值

        Optional<Map<String, Integer>> invalidUnionResult = union(e, conflictingEPrime);
        if (invalidUnionResult.isPresent()) {
            System.out.println("Union of e and conflictingEPrime: " + invalidUnionResult.get());
        } else {
            System.out.println("Union is not valid."); // 应打印这个
        }
    }
}