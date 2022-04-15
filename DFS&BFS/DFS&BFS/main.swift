//
//  main.swift
//  DFS&BFS
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 깊이우선탐색과 너비우선탐색

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

//MARK: - Vairable
var graph: [Graph] = []
var visited: [Bool] = []

//MARK: - Function
func dfs(_ x: Int) -> Void {
    visited[x] = true;
    print("\(x) ", terminator: "")
    
    for i in stride(from: 0, to: graph[x].edges.count, by: 1) {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            visited[y] = true
            dfs(y)
        }
    }
}

func bfs(_ start: Int) -> Void {
    var queue: [Int] = []
    queue.append(start)
    visited[start] = true
    
    while !queue.isEmpty {
        let current: Int = queue.removeFirst()
        print("\(current) ", terminator: "")
        
        for i in stride(from: 0, to: graph[current].edges.count, by: 1) {
            let next: Int = graph[current].edges[i]
            
            if !visited[next] {
                visited[next] = true
                queue.append(next)
            }
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    graph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    
    for _ in 0..<M {
        guard let data: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = data.map { Int($0) }[0] ?? 0
        let b: Int = data.map { Int($0) }[1] ?? 0
        
        graph[a].edges.append(b)
        graph[b].edges.append(a)
    }
    
    //MARK: - Process & Output
    for i in 0..<N {
        graph[i].edges.sort { $0 < $1 }
    }
    
    dfs(0)
    
    visited = Array(repeating: false, count: N + 10)
    print()
    
    bfs(0)
}
solution()
