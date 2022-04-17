//
//  main.swift
//  MinimumSpanningTreeByKruskal
//
//  Created by 이영재 on 2022/04/17.
//MARK: - 최소 신장 트리 - 크루스칼 알고리즘(Kruskal's Algorithm)

//MARK: - Framework
import Foundation

//MARK: - Type
struct Edge {
    //MARK: - Property
    var p, q, cost: Int
    
    //MARK: - Initializer
    init(_ p: Int, _ q: Int, _ cost: Int) {
        self.p = p
        self.q = q
        self.cost = cost
    }
}

//MARK: - Variable
var parent: [Int] = []

//MARK: - Function
func find(_ x: Int) -> Int {
    if x == parent[x] {
        return x
    }
    
    let y: Int = find(parent[x])
    parent[x] = y
    
    return y
}

func unionFind(_ p: Int, _ q: Int) -> Bool {
    let rootP: Int = find(p)
    let rootQ: Int = find(q)
    
    if rootP == rootQ {
        return false
    }
    
    parent[rootP] = rootQ
    return true
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    
    var result: Int = 0
    var edges: [Edge] = []
    parent = Array(repeating: 0, count: N + 10)
    
    for i in stride(from: 1, through: N, by: 1) {
        parent[i] = i
    }
    
    for _ in 0..<M {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        let c: Int = inputData.map { Int($0) }[2] ?? 0
        
        edges.append(Edge(a, b, c))
    }
    
    //MARK: - Process
    edges.sort { $0.cost < $1.cost }
    
    for edge in edges {
        result += unionFind(edge.p, edge.q) ? edge.cost : 0
    }
    
    //MARK: - Output
    print(result)
}
solution()
