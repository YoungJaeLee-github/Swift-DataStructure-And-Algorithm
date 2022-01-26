//
//  main.swift
//  MutipleTable
//
//  Created by 이영재 on 2022/01/25.
//MARK: - 구구단 출력하기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    var answer: String = ""
    
    //MARK: - process
    let N: Int = Int(input) ?? 0
    for i in 1..<9 {
        answer += "\(N)*\(i)=\(N * i)\n"
    }
    answer += "\(N)*\(9)=\(N * 9)"
    
    //MARK: - output
    print(answer)
}
solution()

