package fr.uga.pddl4j.labeledSTN;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

// 冲突定义：冲突本身是一系列的环境，描述不可行的环境
public class Conflict {
    private Set<Map<String, Integer>> conflictSet; // 实际中每个Map应当都为两个，总之要维护这个冲突集。

    public Conflict() {
        this.conflictSet = new HashSet<>();
    }

    // 检查该环境是否包含冲突，如果包含冲突集合中的任意一个冲突，则说明该情景无效。
    public boolean EnvironmentValid(Map<String, Integer> environment) {
        for (Map<String, Integer> aconflict : this.conflictSet) {
            if (EnviUtils.subsumes(environment, aconflict)) {
                return false;
            }
        }
        return true;
    }

    public void add(Map<String, Integer> aconflict) {
        Set<Map<String, Integer>> toRemove = new HashSet<>();
        for (Map<String, Integer> currconflict : this.conflictSet) {
            if (EnviUtils.subsumes(currconflict, aconflict)) {
                return; // 如果新冲突被现有冲突所包含，则不添加新冲突
            }
            if (EnviUtils.subsumes(aconflict, currconflict)) {
                toRemove.add(currconflict); // 如果现有冲突被新冲突所包含，则标记为删除
            }
        }

        this.conflictSet.removeAll(toRemove); // 删除所有被新冲突所包含的现有冲突
        this.conflictSet.add(aconflict); // 添加新冲突
    }

    // ToDo：如果测控资源时长小于事件总和时长，也是一种冲突应该及早发现。
    public boolean EnvironmentValidbyTTC(Map<String, Integer> environment) {
        // todo
        return true;
    }

    // test
    public static void main(String[] args) {
        Conflict c = new Conflict();
        Map<String, Integer> e = new HashMap<>();
        e.put("x", 2);
        e.put("y", 1);

        c.add(e);
        System.out.println(c);

        Map<String, Integer> e2 = new HashMap<>();
        e2.put("x", 1);
        e2.put("y", 1);
        c.add(e2);
        System.out.println(c);

        Map<String, Integer> e3 = new HashMap<>();
        e3.put("x", 1);
        c.add(e3);
        System.out.println(c);

    }

    @Override
    public String toString() {
        return "Conflict [" + conflictSet + "]";
    }
}
