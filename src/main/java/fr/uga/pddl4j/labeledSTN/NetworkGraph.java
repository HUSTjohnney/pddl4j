package fr.uga.pddl4j.labeledSTN;

import org.jgrapht.Graph;
import org.jgrapht.graph.DefaultDirectedGraph;
import org.jgrapht.graph.DefaultEdge;
import org.jgrapht.nio.Attribute;
import org.jgrapht.nio.dot.DOTExporter;
import org.jgrapht.nio.ExportException;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

public class NetworkGraph {

    static class LabelItem {
        String label;

        public LabelItem(String label) {
            this.label = label;
        }

        // 根据需要添加getter、setter
    }

    public static void main(String[] args) {
        // 创建有向图
        Graph<String, DefaultEdge> graph = new DefaultDirectedGraph<>(DefaultEdge.class);

        // 添加节点和边的示例
        graph.addVertex("Node1");
        graph.addVertex("Node2");
        graph.addEdge("Node1", "Node2");

        // 初始化DOTExporter
        DOTExporter<String, DefaultEdge> exporter = new DOTExporter<>(Function.identity(),
                null,
                null,
                v -> {
                    Map<String, Attribute> map = new HashMap<>();
                    // 这里可以根据需要为节点设置属性，例如标签
                    map.put("label", Attribute.createAttribute(v));
                    return map;
                },
                e -> {
                    Map<String, Attribute> map = new HashMap<>();
                    // 这里可以为边设置属性，例如权重、标签等
                    // map.put("weight", Attribute.createAttribute("1.0")); // 举例
                    return map;
                });

        // 导出图
        StringWriter writer = new StringWriter();
        try {
            exporter.exportGraph(graph, writer);
            System.out.println(writer.toString()); // 打印DOT格式的图
        } catch (ExportException e) {
            e.printStackTrace();
        }
    }
}