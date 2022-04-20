//
//  main.swift
//  MoveAlgorithm
//
//  Created by 이영재 on 2022/04/19.
//MARK: - 이동 알고리즘

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    let q: Int = input.map { Int($0) }[2] ?? 0
    let dy: [Int] = [0, 0, 1, -1]
    let dx: [Int] = [1, -1, 0, 0]
    var y: Int = 1, x: Int = 1
    var array: [[Int]] = Array(repeating: Array(repeating: -1, count: M + 10), count: N + 10)
    var answer: String = ""
    
    for i in stride(from: 1, through: N, by: 1) {
        guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
        let numbers: [Int] = inputArray.map { Int($0) ?? 0 }
        
        for j in stride(from: 1, through: M, by: 1) {
            array[i][j] = numbers[j - 1]
        }
    }
    
    //MARK: - Process
    for _ in 0..<q {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let d: Int = inputData.map { Int($0) }[0] ?? 0
        let r: Int = inputData.map { Int($0) }[1] ?? 0
        
        for _ in 0..<r {
            let ny: Int = y + dy[d]
            let nx: Int = x + dx[d]
            
            if array[ny][nx] == -1 {
                break
            }
            
            y = ny
            x = nx
        }
        
        answer += "\(array[y][x])\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
