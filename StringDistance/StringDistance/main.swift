//
//  main.swift
//  StringDistance
//
//  Created by 이영재 on 2022/04/12.
//MARK: - 두 문자열 사이의 거리

//MARK: - Framework
import Foundation

//MARK: - Variable
var table: [[Int]] = []

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let A: String = readLine() else { return }
    guard let B: String = readLine() else { return }
    
    table = Array(repeating: Array(repeating: 0, count: B.count), count: A.count)
    
    //MARK: - Process
    for i in 0..<A.count {
        table[i][0] = i
    }
    
    for i in 0..<B.count {
        table[0][i] = i
    }
    
    for i in 1..<A.count {
        for j in 1..<B.count {
            if A[A.index(A.startIndex, offsetBy: i)] == B[B.index(B.startIndex, offsetBy: j)] {
                table[i][j] = table[i - 1][j - 1]
            } else {
                table[i][j] = table[i - 1][j] < table[i][j - 1] ? table[i - 1][j] + 1 : table[i][j - 1] + 1
            }
        }
    }
    
    //MARK: - Output
    print(table[A.count - 1][B.count - 1])
}
solution()
