//
//  main.swift
//  MazeOfCarpenter
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 목수의 미로 탈출

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
var costOne: [[Int]] = []
var costTwo: [[Int]] = []
var dx: [Int] = [0, 0, -1, 1]
var dy: [Int] = [-1, 1, 0, 0]

//MARK: - Function
func bfs(_ x: Int, _ y: Int, _ cost: inout [[Int]]) -> Void {
    var queue: [Node] = []
    queue.append(Node(x, y))
    visited[x][y] = true
    
    while !queue.isEmpty {
        let currentNode: Node = queue.removeFirst()
        
        for i in 0..<4 {
            let nx: Int = currentNode.x + dx[i]
            let ny: Int = currentNode.y + dy[i]
            
            if 1 <= nx && nx <= N && 1 <= ny && ny <= M && !visited[nx][ny] {
                visited[nx][ny] = true
                cost[nx][ny] = cost[currentNode.x][currentNode.y] + 1
                
                if graph[nx][ny] == 0 {
                    queue.append(Node(nx, ny))
                }
            }
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    var result: Int = 987987987
    
    N = input.map { Int($0) }[0] ?? 0
    M = input.map { Int($0) }[1] ?? 0
    graph = Array(repeating: Array(repeating: 1, count: M + 10), count: N + 10)
    visited = Array(repeating: Array(repeating: false, count: M + 10), count: N + 10)
    costOne = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    costTwo = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    
    for i in 1...N {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let data: [Int] = inputData.map { Int($0) ?? 0 }
        
        for j in 1...M {
            graph[i][j] = data[j - 1]
        }
    }
    
    //MARK: - Process
    bfs(N, 1, &costOne)
    visited = Array(repeating: Array(repeating: false, count: M + 10), count: N + 10)
    bfs(1, M, &costTwo)
    
    for i in 1...N {
        for j in 1...M {
            if graph[i][j] == 1 && costOne[i][j] > 0 && costTwo[i][j] > 0 {
                result = result > costOne[i][j] + costTwo[i][j] ? costOne[i][j] + costTwo[i][j] : result
            }
        }
    }
    
    //MARK: - Output
    print(result)
}
solution()
