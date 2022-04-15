//
//  main.swift
//  WormVirusBFS
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 웜 바이러스 - BFS

//MARK: - Framework
import Foundation

//MARK: - Type
struct Graph {
    var edges: [Int] = []
}

//MARK: - Variable
var graph: [Graph] = []
var visited: [Bool] = []

//MARK: - Function
func bfs(_ start: Int) -> Int {
    var result: Int = 0
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
                result += 1
            }
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let M: Int = Int(readLine() ?? "0") else { return }
    var result: Int = 0
    graph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    
    for _ in 0..<M {
        guard let data: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = data.map { Int($0) }[0] ?? 0
        let b: Int = data.map { Int($0) }[1] ?? 0
        
        graph[a].edges.append(b)
        graph[b].edges.append(a)
    }
    
    //MARK: - Process
    result = bfs(1)
    
    //MARK: - Output
    print(result)
}
solution()

