//
//  main.swift
//  Epidemic
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 전염병

//MARK: - Framework
import Foundation

//MARK: - Variable
var visited: [Bool] = []

//MARK: - Function
func bfs(_ N: Int, _ K: Int) -> Int {
    var count, mul, div: Int
    var queue: [Int] = []
    
    count = 0
    mul = 0
    div = 0
    queue.append(K)
    visited[K] = true
    visited[0] = true
    
    while !queue.isEmpty {
        let current: Int = queue.removeFirst()
        count += 1
        
        if current * 2 <= N {
            mul = current * 2
        }
        div = current / 3
        
        if !visited[mul] {
            visited[mul] = true
            queue.append(mul)
        }
        
        if !visited[div] {
            visited[div] = true
            queue.append(div)
        }
    }
    
    return count
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let K: Int = input.map { Int($0) }[1] ?? 0
    var result: Int = 0
    visited = Array(repeating: false, count: N + 10)
    
    //MARK: - Process
    result = N - bfs(N, K)
    
    //MARK: - Output
    print(result)
}
solution()
