//
//  main.swift
//  NumberingComplexBFS
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 단지 번호 붙이기 - BFS

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
var graph: [[Int]] = []
var visited: [[Bool]] = []
var dx: [Int] = [-1, 1, 0, 0]
var dy: [Int] = [0, 0, -1, 1]

//MARK: - Function
func bfs(_ x: Int, _ y: Int) -> Int {
    var result: Int = 1
    var queue: [Node] = []
    queue.append(Node(x, y))
    visited[x][y] = true
    
    while !queue.isEmpty {
        let currentNode: Node = queue.removeFirst()
        
        for i in 0..<4 {
            let nx: Int = currentNode.x + dx[i]
            let ny: Int = currentNode.y + dy[i]
            
            if !visited[nx][ny] && graph[nx][ny] == 1 {
                visited[nx][ny] = true
                queue.append(Node(nx, ny))
                result += 1
            }
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var homeCounts: [Int] = []
    graph = Array(repeating: Array(repeating: 0, count: N + 10), count: N + 10)
    visited = Array(repeating: Array(repeating: false, count: N + 10), count: N + 10)
    
    for i in 1...N {
        guard let data: String = readLine() else { return }
        for j in 1...N {
            graph[i][j] = Int("\(data[data.index(data.startIndex, offsetBy: j - 1)])")!
        }
    }
    
    //MARK: - Process
    for i in 1...N {
        for j in 1...N {
            if graph[i][j] == 1 && !visited[i][j] {
                homeCounts.append(bfs(i, j))
            }
        }
    }
    
    homeCounts.sort { $0 < $1 }
    
    //MARK: - Output
    print(homeCounts.count)
    for count in homeCounts {
        print(count)
    }
}
solution()

