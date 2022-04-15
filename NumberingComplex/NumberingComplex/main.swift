//
//  main.swift
//  NumberingComplex
//
//  Created by 이영재 on 2022/04/14.
//MARK: - 단지 번호 붙이기

//MARK: - Framework
import Foundation

//MARK: - Variable
var graph: [[Int]] = []
var visited: [[Bool]] = []
var count: Int = 0

//MARK: - Function
func dfs(_ x: Int, _ y: Int) -> Void {
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    visited[x][y] = true
    count += 1
    
    for i in 0..<dx.count {
        let nx: Int = x + dx[i]
        let ny: Int = y + dy[i]
        
        if graph[nx][ny] == 1 && !visited[nx][ny] {
            dfs(nx, ny)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var homeCounts: [Int] = []
    graph = Array(repeating: Array(repeating: 0, count: N + 10), count: N + 10)
    visited = Array(repeating: Array(repeating: false, count: N + 10), count: N + 10)
    
    for i in 1...N {
        guard let str: String = readLine() else { return }
        for j in 0..<str.count {
            graph[i][j + 1] = Int("\(str[str.index(str.startIndex, offsetBy: j)])") ?? 0
        }
    }
    
    //MARK: - Process
    for i in 1...N {
        for j in 1...N {
            if graph[i][j] == 1 && !visited[i][j] {
                dfs(i, j)
                homeCounts.append(count)
                count = 0
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
