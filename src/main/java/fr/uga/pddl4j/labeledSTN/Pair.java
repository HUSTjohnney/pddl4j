package fr.uga.pddl4j.labeledSTN;

import java.util.Map;

public class Pair {
    Map<String, Integer> e;
    Integer value;

    public Pair(Map<String, Integer> evir, Integer value) {
        this.e = evir;
        this.value = value;
    }

    // Consider implementing equals and hashCode
}