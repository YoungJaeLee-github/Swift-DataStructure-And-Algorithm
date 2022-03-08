//
//  main.swift
//  Fibonacci
//
//  Created by 이영재 on 2022/03/07.
//MARK: - fibonacci

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var fibonacci: [Int] = Array(repeating: 0, count: n + 10)
    
    //MARK: - Process
    fibonacci[0] = 0
    fibonacci[1] = 1
    if n >= 2 {
        for i in 2...n {
            fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
        }
    }
    
    //MARK: - Output
    print(fibonacci[n])
}
solution()
