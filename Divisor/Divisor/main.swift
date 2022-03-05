//
//  main.swift
//  Divisor
//
//  Created by 이영재 on 2022/03/05.
//MARK: - 약수

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var answer: String = "\(1) "
    
    //MARK: - Process
    for i in 2..<N {
        answer += N % i == 0 ? "\(i) " : ""
    }
    answer += "\(N)"
    
    //MARK: - Output
    print(answer)
}
solution()
