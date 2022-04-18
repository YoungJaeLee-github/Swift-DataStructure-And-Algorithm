//
//  main.swift
//  RotationAlgorithm
//
//  Created by 이영재 on 2022/04/18.
//MARK: - 회전 알고리즘

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let q: Int = input.map { Int($0) }[1] ?? 0
    
    guard let inputA: [String] = readLine()?.components(separatedBy: " ") else { return }
    let a: [Int] = inputA.map { Int($0) ?? 0 }
    var x: Int = 0
    var answer: String = ""
    
    
    //MARK: - Process & Output
    for _ in 0..<q {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let d: Int = inputData.map { Int($0) }[0] ?? 0
        var y: Int = inputData.map { Int($0) }[1] ?? 0
        y = y >= n ? y % n : y
        
        switch d {
        case 1:
            x = x + y >= n ? x + y - n : x + y
        case 2:
            x = x - y < 0 ? n + (x - y) : x - y
        default:
            break
        }
        
        answer += "\(a[x])\n"
    }
    
    print(answer)
}
solution()
