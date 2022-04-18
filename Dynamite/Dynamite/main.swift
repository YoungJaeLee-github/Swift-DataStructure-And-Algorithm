//
//  main.swift
//  Dynamite
//
//  Created by 이영재 on 2022/04/18.
//MARK: - 폭발물 설치

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
var graph: [Graph] = []
var visited: [Bool] = []
var orders: [Int] = []
var orderCount: Int = 0

//MARK: - Function
func getOrderDFS(_ x: Int) -> Void {
    visited[x] = true
    
    for i in 0..<graph[x].edges.count {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            getOrderDFS(y)
        }
    }
    
    orders.append(x)
}

func graphDFS(_ x: Int) -> Void {
    visited[x] = true
    
    for i in 0..<graph[x].edges.count {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            graphDFS(y)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    var dynamiteCount: Int = 0
    
    graph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    
    for _ in 0..<M {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        graph[a].edges.append(b)
    }
    
    //MARK: - Process
    for i in stride(from: 1, through: N, by: 1) {
        if !visited[i] {
            getOrderDFS(i)
        }
    }
    
    visited = Array(repeating: false, count: N + 10)
    
    for i in stride(from: orders.count - 1, through: 0, by: -1) {
        if !visited[orders[i]] {
            graphDFS(orders[i])
            dynamiteCount += 1
        }
    }
    
    //MARK: - Output
    print(dynamiteCount)
}
solution()
