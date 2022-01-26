//
//  main.swift
//  Countdown
//
//  Created by 이영재 on 2022/01/26.
//MARK: - Countdown

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let N: Int = Int(input) ?? 0
    var answer: String = ""
    
    //MARK: - process
    for i in stride(from: N, to: 1, by: -1) {
        answer += "\(i)\n"
    }
    answer += "\(1)"
    
    //MARK: - output
    print(answer)
}
solution()

