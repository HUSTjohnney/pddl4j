package fr.uga.pddl4j.labeledSTN;

import java.util.Arrays;
import java.util.Map;

class LabeledEdge {
    int source;
    int target;
    int weight;
    Map<String, Integer> labeled;

    public LabeledEdge(int source, int target, int weight) {
        this.source = source;
        this.target = target;
        this.weight = weight;
    }
}

public class LabeledBellmanFord {
    private int vertices;
    private Edge[] edges;
    private int edgeCount;

    public LabeledBellmanFord(int vertices, int maxEdges) {
        this.vertices = vertices;
        this.edges = new Edge[maxEdges];
        this.edgeCount = 0;
    }

    public void addEdge(int source, int target, int weight) {
        edges[edgeCount++] = new Edge(source, target, weight);
    }

    public boolean bellmanFord(int src) {
        int[] dist = new int[vertices];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[src] = 0;

        // Relax all edges |V| - 1 times
        // "松弛"是一种重要的操作，它的目的是尝试通过某条边改进到某个顶点的最短路径估计。
        // 如检查是否能通过顶点A到达顶点B，以获得一个比当前已知从源点到顶点B的路径更短的路径。
        for (int i = 1; i < vertices; ++i) {
            for (int j = 0; j < edgeCount; ++j) {
                int u = edges[j].source;
                int v = edges[j].target;
                int weight = edges[j].weight;
                if (dist[u] != Integer.MAX_VALUE && dist[u] + weight < dist[v]) {
                    dist[v] = dist[u] + weight;
                }
            }
        }

        // Check for negative-weight cycles
        // 如果存在负环值 说明时态网络不一致。
        for (int j = 0; j < edgeCount; ++j) {
            int u = edges[j].source;
            int v = edges[j].target;
            int weight = edges[j].weight;
            if (dist[u] != Integer.MAX_VALUE && dist[u] + weight < dist[v]) {
                System.out.println("Graph contains negative weight cycle");
                return false;
            }
        }

        printSolution(dist);
        return true;
    }

    void printSolution(int[] dist) {
        System.out.println("Vertex Distance from Source");
        for (int i = 0; i < vertices; ++i)
            System.out.println(i + "\t\t" + dist[i]);
    }

    public static void main(String[] args) {
        int vertices = 5; // 顶点数
        int edges = 8; // 边数
        LabeledBellmanFord graph = new LabeledBellmanFord(vertices, edges);

        // 添加边。例如：graph.addEdge(0, 1, -1) 表示从顶点0到顶点1的权重为-1的边
        // 这里添加STN中的约束作为边
        // 示例添加边代码：
        graph.addEdge(0, 1, -1);
        graph.addEdge(1, 2, -3);
        graph.addEdge(2, 4, 3);
        graph.addEdge(1, 3, 2);

        // 调用bellmanFord算法，以顶点0为源点
        graph.bellmanFord(0);
    }
}
