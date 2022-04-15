//
//  main.swift
//  StrangeCalculator
//
//  Created by 이영재 on 2022/04/15.
//MARK: - 이상한 계산기

//MARK: - Framework
import Foundation

//MARK: - Variable
var N: Int = 0
let MAX: Int = 1000000
var visited: [Bool] = []

//MARK: - Function
func bfs(_ start: Int) -> Int {
    var counts: [Int] = Array(repeating: 0, count: MAX)
    var queue: [Int] = []
    var mul: Int = 0
    var div: Int = 0
    
    queue.append(start)
    visited[start] = true
    
    while !queue.isEmpty {
        let current: Int = queue.removeFirst()
        
        if current * 2 < MAX {
            mul = current * 2
        }
        div = current / 3
        
        if !visited[mul] {
            visited[mul] = true
            queue.append(mul)
            counts[mul] = counts[current] + 1
        }
        
        if !visited[div] {
            visited[div] = true
            queue.append(div)
            counts[div] = counts[current] + 1
        }
    }
    
    return counts[N]
}

func solution() -> Void {
    //MARK: - Input
    var result: Int = 0
    N = Int(readLine() ?? "0") ?? 0
    visited = Array(repeating: false, count: MAX)
    
    //MARK: - Process
    result = bfs(1)
    
    //MARK: - Output
    print(result)
}
solution()
