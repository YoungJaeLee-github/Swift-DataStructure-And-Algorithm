//
//  main.swift
//  WormVirus
//
//  Created by 이영재 on 2022/04/14.
//MARK: - 웜 바이러스

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
var count: Int = 0

//MARK: - Function
func dfs(_ x: Int) -> Void {
    visited[x] = true
    
    for i in 0..<graph[x].edges.count {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            count += 1
            dfs(y)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let M: Int = Int(readLine() ?? "0") else { return }
    graph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    
    for _ in 0..<M {
        guard let inputData = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        graph[a].edges.append(b)
        graph[b].edges.append(a)
    }
    
    //MARK: - Process
    dfs(1)
    
    //MARK: - Output
    print(count)
}
solution()
