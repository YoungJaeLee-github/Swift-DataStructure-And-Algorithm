//
//  main.swift
//  MakePalindrome
//
//  Created by 이영재 on 2022/04/12.
//MARK: - 팰린드롬 만들기

//MARK: - Framework
import Foundation

//MARK: - Variable
var table: [[Int]] = []

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str: String = readLine() else { return }
    table = Array(repeating: Array(repeating: 0, count: str.count), count: str.count)
    
    //MARK: - Process
    for i in 0..<str.count {
        table[i][i] = 0
    }
    
    for i in stride(from: str.count - 1, through: 0, by: -1) {
        for j in stride(from: i + 1, to: str.count, by: 1) {
            if str[str.index(str.startIndex, offsetBy: i)] == str[str.index(str.startIndex, offsetBy: j)] {
                table[i][j] = table[i + 1][j - 1]
            } else {
                table[i][j] = table[i + 1][j] < table[i][j - 1] ? table[i + 1][j] + 1 : table[i][j - 1] + 1
            }
        }
    }
    
    //MARK: - Output
    print(table[0][str.count - 1])
}
solution()
