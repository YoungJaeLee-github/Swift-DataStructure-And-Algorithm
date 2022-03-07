//
//  main.swift
//  Pascal
//
//  Created by 이영재 on 2022/03/07.
//MARK: - 파스칼 삼각형

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var pascalTriangle: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 10), count: N + 10)
    
    //MARK: - Process
    pascalTriangle[0][0] = 1
    for i in 1...N {
        pascalTriangle[i][0] = 1    //n C 0 = 1
        pascalTriangle[i][i] = 1    //n C n = 1
        
        for j in 1..<i {
            pascalTriangle[i][j] = pascalTriangle[i - 1][j - 1] + pascalTriangle[i - 1][j]
        }
    }
    
    //MARK: - Output
    for i in 0...N {
        for j in 0..<N {
            if pascalTriangle[i][j] == 0 {
                continue
            }
            print("\(pascalTriangle[i][j]) ", terminator: "")
        }
        if pascalTriangle[i][N] == 0 {
            print()
        } else {
            print(pascalTriangle[i][N])
        }
    }
}
solution()
