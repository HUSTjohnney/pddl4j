package fr.uga.pddl4j.labeledSTN;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

// 标签值对集合的定义，包括查询函数（查询基于当前条件下的最优值），添加函数（添加一个新的标签值对，并进行冗余检查）。
public class LabeledValueSet {
    private Set<Pair> labelValueSet;

    public LabeledValueSet() {
        this.labelValueSet = new HashSet<>();
    }

    public void add(Pair newPair) {
        // 首先，检查是否已经有包含newPair.e且在f上不劣于newPair的元素存在
        boolean isRedundant = false;
        Iterator<Pair> iterator = labelValueSet.iterator();
        while (iterator.hasNext()) {
            Pair existingPair = iterator.next();
            // 如果newPair被existingPair包含且existingPair的值不劣于newPair，则newPair冗余，不添加
            if (EnviUtils.subsumes(existingPair.e, newPair.e) && EnviUtils.f(existingPair.value, newPair.value)) {
                isRedundant = true;
                return;
            }
            // 如果existingPair被newPair包含且newPair的值不劣于existingPair，则existingPair冗余
            if (EnviUtils.subsumes(newPair.e, existingPair.e) && EnviUtils.f(newPair.value, existingPair.value)) {
                iterator.remove(); // 移除冗余的existingPair
                labelValueSet.add(newPair);
            }
        }

        // 如果newPair不冗余，则添加到集合
        if (!isRedundant) {
            labelValueSet.add(newPair);
        }

    }

    public void add(Integer value, Map<String, Integer> e) {
        this.add(new Pair(value, e));
    }

    private Integer query(Map<String, Integer> e) {
        Pair dominatingPair = null;
        for (Pair pair : labelValueSet) {
            if (EnviUtils.subsumes(pair.e, e)) {
                // 需要检查所有包含e的环境，并选择最优的值
                if (dominatingPair == null || EnviUtils.f(pair.value, dominatingPair.value) == true) {
                    dominatingPair = pair;
                }
            }
        }
        return dominatingPair != null ? dominatingPair.value : null;
    }

    public static void main(String[] args) {

        // 创建一个空的标记值集
        LabeledValueSet A = new LabeledValueSet();

        // 添加一些值
        HashMap<String, Integer> environment1 = new HashMap<>();
        environment1.put("x", 1);
        A.add(3, environment1); // x=1时值为3

        System.out.println(A);

        HashMap<String, Integer> emptyEnvironment = new HashMap<>();
        A.add(5, emptyEnvironment); // 没有条件时值为5
        HashMap<String, Integer> environment2 = new HashMap<>();
        environment2.put("y", 2);

        System.out.println(A);

        // 查询：在不同环境下查询值
        System.out.println("Query with x=1: " + A.query(environment1)); // 应返回3
        System.out.println("Query with y=2:" + A.query(environment2));
        System.out.println("Query with empty environment: " + A.query(new HashMap<>())); // 应返回5

        // 添加一个新值，它将使先前的某个值变得冗余
        A.add(4, environment2); // y=2时值为4
        System.out.println(A);

        System.out.println("Query with y=2: " + A.query(environment2)); // 应返回4
        System.out.println("Query with empty environment after adding y=2: "
                + A.query(new HashMap<>())); // 应返回5

        // 添加一个会使先前值冗余的环境
        HashMap<String, Integer> overridingEnvironment = new HashMap<>();
        A.add(6, overridingEnvironment); // 无条件时值为6

        System.out.println("Query with empty environment after overriding: "
                + A.query(new HashMap<>())); // 应返回5
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Pair pair : labelValueSet) {
            sb.append(pair.toString());
        }
        return "LabeledValueSet [set=" + sb.toString() + "]";
    }

}