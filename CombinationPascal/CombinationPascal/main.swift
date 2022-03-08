//
//  main.swift
//  CombinationPascal
//
//  Created by 이영재 on 2022/03/08.
//MARK: - combinationpascal

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var combinationPascal: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 10), count: n + 10)
    
    //MARK: - Process
    combinationPascal[0][0] = 1
    for i in 1...n {
        combinationPascal[i][0] = 1 // n C 0 = 1
        combinationPascal[i][i] = 1 // n C n = 1
        
        for j in 1..<i {
            combinationPascal[i][j] = combinationPascal[i - 1][j - 1] + combinationPascal[i - 1][j]
        }
    }
    
    //MARK: - Output
    print(combinationPascal[n][m])
}
solution()
