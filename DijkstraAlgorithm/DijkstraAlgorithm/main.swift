//
//  main.swift
//  DijkstraAlgorithm
//
//  Created by 이영재 on 2022/04/16.
//MARK: - 다익스트라 알고리즘

//MARK: - Framework
import Foundation

//MARK: - Type
struct Graph {
    //MARK: - Property
    var edges: [Int]
    var costs: [Int]
    
    //MARK: - Initializer
    init() {
        self.edges = []
        self.costs = []
    }
}

//MARK: - Variable
var graph: [Graph] = []
var visited: [Bool] = []

//MARK: - Function
func dijkstra(_ N: Int, _ start: Int, _ end: Int) -> Int {
    var distances: [Int] = Array(repeating: 987987987, count: N + 10)
    distances[start] = 0
    
    for _ in 0..<N {
        var minCost, minIndex: Int
        minCost = 987987987
        minIndex = -1
        
        for j in 0..<N {
            if !visited[j] && minCost > distances[j] {
                minCost = distances[j]
                minIndex = j
            }
        }
        visited[minIndex] = true
        
        for j in 0..<graph[minIndex].edges.count {
            let y: Int = graph[minIndex].edges[j]
            let cost: Int = graph[minIndex].costs[j]
            
            if distances[y] > distances[minIndex] + cost {
                distances[y] = distances[minIndex] + cost
            }
        }
    }
    
    return distances[end]
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    let start: Int = input.map { Int($0) }[2] ?? 0
    let end: Int = input.map { Int($0) }[3] ?? 0
    var result: Int = 0
    
    graph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    
    for _ in 0..<M {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        let c: Int = inputData.map { Int($0) }[2] ?? 0
        
        graph[a].edges.append(b)
        graph[b].edges.append(a)
        graph[a].costs.append(c)
        graph[b].costs.append(c)
    }
    
    //MARK: - Process
    result = dijkstra(N, start, end)
    
    //MARK: - Output
    print(result)
}
solution()
