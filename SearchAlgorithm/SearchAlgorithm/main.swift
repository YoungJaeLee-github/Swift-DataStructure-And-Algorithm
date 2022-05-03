//
//  main.swift
//  SearchAlgorithm
//
//  Created by 이영재 on 2022/05/01.
//MARK: - 조회 알고리즘

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    let dy: [Int] = [0, 0, -1, 1]
    let dx: [Int] = [-1, 1, 0, 0]
    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 10), count: n + 10)
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 10), count: n + 10)
    var answer: String = ""
    
    for i in stride(from: 1, through: n, by: 1) {
        guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
        let numbers: [Int] = inputArray.map { Int($0) ?? 0 }
        
        for j in stride(from: 1, through: m, by: 1) {
            array[i][j] = numbers[j - 1]
        }
    }
    
    //MARK: - Process
    for i in stride(from: 1, through: n, by: 1) {
        for j in stride(from: 1, through: m, by: 1) {
            var flag: Bool = false
            for k in 0..<4 {
                if array[i][j] == array[i + dy[k]][j + dx[k]] {
                    flag = true
                }
            }
            
            result[i][j] = flag ? 1 : 0
        }
        
        if array[i][1] == array[i][m] {
            result[i][1] = 1
            result[i][m] = 1
        }
    }
    
    for i in stride(from: 1, through: n, by: 1) {
        for j in stride(from: 1, to: m, by: 1) {
            answer += "\(result[i][j]) "
        }
        answer += "\(result[i][m])\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
