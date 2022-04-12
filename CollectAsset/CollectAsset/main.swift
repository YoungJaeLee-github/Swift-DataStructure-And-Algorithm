//
//  main.swift
//  CollectAsset
//
//  Created by 이영재 on 2022/04/12.
//MARK: - 자원 채취

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    var table: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    
    for i in 1...N {
        guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
        
        for j in 1...M {
            table[i][j] = inputArray.map { Int($0) ?? 0 }[j - 1]
        }
    }
    
    //MARK: - Process
    for i in 1...N {
        for j in 1...M {
            table[i][j] += table[i][j - 1] < table[i - 1][j] ? table[i - 1][j] : table[i][j - 1]
        }
    }
    
    //MARK: - Output
    print(table[N][M])
}
solution()
