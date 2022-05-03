//
//  main.swift
//  SpecificShortestPath
//
//  Created by 이영재 on 2022/04/16.
//MARK: - 특정 최단거리

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

//MARK: - Variable
var graph: [Graph] = []

//MARK: - Function
func dijkstra(_ N: Int, _ start: Int, _ end: Int) -> Int64 {
    var visited: [Bool] = Array(repeating: false, count: N + 10)
    var distances: [Int64] = Array(repeating: 987987987, count: N + 10)
    distances[start] = 0

    for _ in stride(from: 1, through: N, by: 1) {
        var minCost: Int64 = 987987978
        var minIndex: Int = -1

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

            if distances[y] > distances[minIndex] + Int64(cost) {
                distances[y] = distances[minIndex] + Int64(cost)
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
    var result: [Int64] = []
    graph = Array(repeating: Graph(), count: N + 10)

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

    guard let data: [String] = readLine()?.components(separatedBy: " ") else { return }
    let A: Int = data.map { Int($0) }[0] ?? 0
    let B: Int = data.map { Int($0) }[1] ?? 0

    //MARK: - Process
    result.append(dijkstra(N, 1, A) + dijkstra(N, A, B) + dijkstra(N, B, N))
    result.append(dijkstra(N, 1, B) + dijkstra(N, B, A) + dijkstra(N, A, N))

    //MARK: - Output
    print(result[0] < result[1] ? result[0] : result[1])
}
solution()
