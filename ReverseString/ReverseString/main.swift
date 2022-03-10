//
//  main.swift
//  ReverseString
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 문자열 뒤집기

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str = readLine() else { return }
    var result: String = ""
    var stack: [Character] = []
    
    //MARK: - Process
    for char in str {
        stack.append(char)
    }
    
    while !stack.isEmpty {
        result += "\(stack.remove(at: stack.count - 1))"
    }
    
    //MARK: - Output
    print(result)
}
solution()
