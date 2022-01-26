//
//  main.swift
//  NtoM2
//
//  Created by 이영재 on 2022/01/26.
//MARK: - N to M 2

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    var count: Int = 0
    var answer: String = ""
    
    //MARK: - process
    for i in N..<M {
        if count == 8 {
            answer += "\n"
            count = 0
        }
        
        answer += "\(i) "
        count += 1
    }
    answer += count == 8 ? "\n\(M)" : "\(M)"
    
    //MARK: - output
    print(answer)
}
solution()

