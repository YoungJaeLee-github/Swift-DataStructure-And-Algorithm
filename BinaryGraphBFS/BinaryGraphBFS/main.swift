//
//  main.swift
//  BinaryGraphBFS
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 이분 그래프 판별 - BFS

//MARK: - Framework
import Foundation

//MARK: - Type
struct Graph {
    //MARK: - Property
    var edges: [Int]
    
    //MARK: - Initializer
    init() {
        self.edges = []
    }
}

//MARK: - Variable
var graph: [Graph] = []
var visited: [Bool] = []
var groups: [Int] = []

//MARK: - Function
func bfs(_ start: Int) -> Bool {
    var result: Bool = true
    var queue: [Int] = []
    queue.append(start)
    visited[start] = true
    
    while !queue.isEmpty {
        let current: Int = queue.removeFirst()
        
        for i in stride(from: 0, to: graph[current].edges.count, by: 1) {
            let next: Int = graph[current].edges[i]
            
            if !visited[next] {
                visited[next] = true
                queue.append(next)
                groups[next] = groups[current] == 0 ? 1 : 0
            } else {
                if groups[next] == groups[current] {
                    result = false
                    break
                }
            }
        }
        
        if !result {
            break
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    graph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    groups = Array(repeating: 0, count: N + 10)
    
    for _ in 0..<M {
        guard let data: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = data.map { Int($0) }[0] ?? 0
        let b: Int = data.map { Int($0) }[1] ?? 0
        
        graph[a].edges.append(b)
        graph[b].edges.append(a)
    }
    
    //MARK: - Process & Output
    print(bfs(1) ? "Yes" : "No")
}
solution()

