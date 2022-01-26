//
//  main.swift
//  MultipleOfThree
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 3의 배수

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    
    let N: Int = Int(input) ?? 1
    var answer: String = ""
    
    //MARK: - process
    for i in 1..<N {
        answer += i % 3 == 0 ? "X " : "\(i) "
    }
    answer += N % 3 == 0 ? "X" : "\(N)"
    
    //MARK: - output
    print(answer)
}
solution()
