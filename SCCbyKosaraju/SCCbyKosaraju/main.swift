//
//  main.swift
//  SCCbyKosaraju
//
//  Created by 이영재 on 2022/04/18.
//MARK: - SCC(Strongly Connected Component) - 코사라주 알고리즘(Kosaraju's Algorithm)

//MARK: - Framework
import Foundation

//MARK: - Type
struct Graph {
    //MARK: - Property
    var edges: [Int]
    
    //MARK: - Init
    init() {
        self.edges = []
    }
}

//MARK: - Variable
var graph: [Graph] = [], reverseGraph: [Graph] = []
var visited: [Bool] = []
var orders: [Int] = [], groups: [Int] = []
var orderCount: Int = 0, groupCount: Int = 0

//MARK: - Function
func graphDFS(_ x: Int) -> Void {
    visited[x] = true
    
    for i in 0..<graph[x].edges.count {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            graphDFS(y)
        }
    }
    
    orders[orderCount] = x
    orderCount += 1
}

func reverseGraphDFS(_ x: Int) -> Void {
    visited[x] = true
    groups[x] = groupCount
    
    for i in 0..<reverseGraph[x].edges.count {
        let y: Int = reverseGraph[x].edges[i]
        
        if !visited[y] {
            reverseGraphDFS(y)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    graph = Array(repeating: Graph(), count: N + 10)
    reverseGraph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    orders = Array(repeating: 0, count: N + 10)
    groups = Array(repeating: 0, count: N + 10)
    
    for _ in 0..<M {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        graph[a].edges.append(b)
        reverseGraph[b].edges.append(a)
    }
    
    //MARK: - Process
    for i in stride(from: 1, through: N, by: 1) {
        if !visited[i] {
            graphDFS(i)
        }
    }
    
    visited = Array(repeating: false, count: N + 10)
    
    for i in stride(from: orderCount - 1, through: 0, by: -1) {
        if !visited[orders[i]] {
            reverseGraphDFS(orders[i])
            groupCount += 1
        }
    }
    
    //MARK: - Output
    print(groupCount)
}
solution()
