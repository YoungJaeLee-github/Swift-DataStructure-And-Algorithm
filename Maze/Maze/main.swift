//
//  main.swift
//  Maze
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 미로 찾기

//MARK: - Framework
import Foundation

//MARK: - Type
struct Node {
    //MARK: - Property
    var x, y: Int
    
    //MARK: - Initializer
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

//MARK: - Variable
var N: Int = 0
var M: Int = 0
var graph: [[Int]] = []
var visited: [[Bool]] = []
var distances: [[Int]] = []
var dx: [Int] = [0, 0, -1, 1]
var dy: [Int] = [-1, 1, 0, 0]

//MARK: - Function
func bfs(_ x: Int, _ y: Int) -> Int {
    var queue: [Node] = []
    queue.append(Node(x, y))
    visited[x][y] = true
    
    while !queue.isEmpty {
        let currentNode: Node = queue.removeFirst()
        
        for i in 0..<4 {
            let nx: Int = currentNode.x + dx[i]
            let ny: Int = currentNode.y + dy[i]
            
            if !visited[nx][ny] && graph[nx][ny] == 0 {
                visited[nx][ny] = true
                queue.append(Node(nx, ny))
                distances[nx][ny] = distances[currentNode.x][currentNode.y] + 1
            }
        }
    }
    
    return distances[1][M]
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    var result: Int = 0
    N = input.map { Int($0) }[0] ?? 0
    M = input.map { Int($0) }[1] ?? 0
    graph = Array(repeating: Array(repeating: 1, count: M + 10), count: N + 10)
    visited = Array(repeating: Array(repeating: false, count: M + 10), count: N + 10)
    distances = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    
    for i in 1...N {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let data: [Int] = inputData.map { Int($0) ?? 0 }
        
        for j in 1...M {
            graph[i][j] = data[j - 1]
        }
    }
    
    //MARK: - Process
    result = bfs(N, 1)
    
    //MARK: - Output
    print(result)
}
solution()
