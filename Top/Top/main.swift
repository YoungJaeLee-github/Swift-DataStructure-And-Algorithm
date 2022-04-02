//
//  main.swift
//  Top
//
//  Created by 이영재 on 2022/04/02.
//MARK: - 탑

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let _: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let array: [Int] = inputArray.map { Int($0) ?? 0 }
    var stack: [Int] = []
    var result: [Int] = Array(repeating: 0, count: array.count)
    var answer: String = ""
    
    //MARK: - Process
    stack.append(array.count - 1)
    
    for i in stride(from: array.count - 2, through: 0, by: -1) {
        while stack.count > 0 && array[stack[stack.count - 1]] < array[i] {
            result[stack.removeLast()] = i + 1
        }
        stack.append(i)
    }
    
    for i in 0..<result.count - 1 {
        answer += "\(result[i]) "
    }
    answer += "\(result[result.count - 1])"
    
    //MARK: - Output
    print(answer)
}
solution()
