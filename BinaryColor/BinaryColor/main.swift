//
//  main.swift
//  BinaryColor
//
//  Created by 이영재 on 2022/04/14.
//MARK: - 2색칠하기

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
var flag: Bool = false

//MARK: - Function
func dfs(_ x: Int) -> Void {
    visited[x] = true
    
    for i in 0..<graph[x].edges.count {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            groups[y] = groups[x] == 0 ? 1 : 0
            dfs(y)
        }
        
        if groups[y] == groups[x] {
            flag = false
            return
        }
    }
    
    flag = true
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
        guard let inputData = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        graph[a].edges.append(b)
        graph[b].edges.append(a)
    }
    
    //MARK: - Process
    dfs(0)
    
    //MARK: - Output
    print(flag ? "YES" : "NO")
}
solution()
