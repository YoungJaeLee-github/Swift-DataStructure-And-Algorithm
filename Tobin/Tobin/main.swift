//
//  main.swift
//  Tobin
//
//  Created by 이영재 on 2022/03/30.
//MARK: - tobin

//MARK: - Framework
import Foundation

//MARK: - Variable
var n: Int = 0
var k: Int = 0

//MARK: - Function
func getBinary(_ current: Int, _ result: inout [Int]) -> Void {
    if current >= n {
        if k == 0 {
            var answer: String = ""
            for i in 0..<n {
                answer += "\(result[i])"
            }
            
            print(answer)
        }
    } else {
        if k == 0 {
            var answer: String = ""
            for i in 0..<n {
                answer += "\(result[i])"
            }
            
            print(answer)
        } else {
            for i in stride(from: 1, through: 0, by: -1) {
                result[current] = i
                k += i == 1 ? -1 : 0
                getBinary(current + 1, &result)
                k += i == 1 ? 1 : 0
            }
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    n = input.map { Int($0) }[0] ?? 0
    k = input.map { Int($0) }[1] ?? 0
    var result: [Int] = Array(repeating: 0, count: n + 10)
    
    //MARK: - Process & Output
    getBinary(0, &result)
}
solution()
