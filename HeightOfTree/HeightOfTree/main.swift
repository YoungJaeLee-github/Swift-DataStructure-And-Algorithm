//
//  main.swift
//  HeightOfTree
//
//  Created by 이영재 on 2022/04/06.
//MARK: - 트리의 높이

//MARK: - Framework
import Foundation

//MARK: - Type
struct Node {
    //MARK: - Property
    private var edges: [Int]
    
    //MARK: - Initializer
    init() {
        self.edges = []
    }
    
    //MARK: - Method
    mutating func push(_ data: Int) -> Void {
        self.edges.append(data)
    }
    
    func getNodeData(_ index: Int) -> Int {
        return self.edges[index]
    }
    
    func size() -> Int {
        return self.edges.count
    }
}

//MARK: - Function
func dfs(_ tree: [Node], _ visited: inout [Bool], _ levels: inout [Int], _ node: Int, _ currentLevel: Int) -> Void {
    visited[node] = true
    levels[node] = currentLevel
    
    for i in 0..<tree[node].size() {
        let y: Int = tree[node].getNodeData(i)
        if !visited[y] {
            dfs(tree, &visited, &levels, y, currentLevel + 1)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let inputTreeInfo: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = inputTreeInfo.map { Int($0) }[0] ?? 0
    let r: Int = inputTreeInfo.map { Int($0) }[1] ?? 0
    var tree: [Node] = Array(repeating: Node(), count: n + 10)
    var visited: [Bool] = Array(repeating: false, count: n + 10)
    var levels: [Int] = Array(repeating: 0, count: n + 10)
    var height: Int = 0
    
    for _ in 0..<n - 1 {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        tree[a].push(b)
        tree[b].push(a)
    }
    
    //MARK: - Process
    dfs(tree, &visited, &levels, r, 0)
    
    for level in levels {
        height = height < level ? level : height
    }
    
    //MARK: - Output
    print(height)
}
solution()
