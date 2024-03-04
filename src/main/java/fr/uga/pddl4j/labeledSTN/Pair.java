package fr.uga.pddl4j.labeledSTN;

import java.util.Map;

public class Pair {
    Map<String, Integer> e;
    Integer value;

    public Pair(Integer value, Map<String, Integer> evir) {
        this.e = evir;
        this.value = value;
    }

    @Override
    public String toString() {
        return "[e=" + e + ", value=" + value + "]";
    }

    // Consider implementing equals and hashCode
}