//
//  main.swift
//  NtoM
//
//  Created by 이영재 on 2022/01/25.
//MARK: - N to M

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    var answer: String = ""
    
    //MARK: - process
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    
    for i in N..<M {
        answer += "\(i) "
    }
    answer += "\(M)"
    
    //MARK: - output
    print(answer)
}

solution()
