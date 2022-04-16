//
//  main.swift
//  Party
//
//  Created by 이영재 on 2022/04/16.
//MARK: - 파티

//MARK: - Framework
import Foundation

//MARK: - Type
struct Graph {
    //MARK: - Property
    var edges, costs: [Int]
    
    //MARK: - Initializer
    init() {
        self.edges = []
        self.costs = []
    }
}

//MARK: - Function
func dijkstra(_ graph: [Graph], _ N: Int, _ K: Int) -> Int {
    var visited: [Bool] = Array(repeating: false, count: N + 10)
    var distances: [Int] = Array(repeating: 987987987, count: N + 10)
    var sum: Int = 0
    distances[K] = 0
    
    for _ in stride(from: 1, through: N, by: 1) {
        var minCost, minIndex: Int
        minCost = 987987987
        minIndex = -1
        
        for j in stride(from: 1, through: N, by: 1) {
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
    
    for i in stride(from: 1, through: N, by: 1) {
        sum += distances[i]
    }
    
    return sum
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    let K: Int = input.map { Int($0) }[2] ?? 0
    var result: Int = 0
    var graphOne: [Graph] = Array(repeating: Graph(), count: N + 10)
    var graphTwo: [Graph] = Array(repeating: Graph(), count: N + 10)
    
    for _ in 0..<M {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        let c: Int = inputData.map { Int($0) }[2] ?? 0
        
        graphOne[a].edges.append(b)
        graphTwo[b].edges.append(a)
        graphOne[a].costs.append(c)
        graphTwo[b].costs.append(c)
    }
    
    //MARK: - Process
    result = dijkstra(graphOne, N, K) + dijkstra(graphTwo, N, K)
    
    //MARK: - Output
    print(result)
}
solution()
