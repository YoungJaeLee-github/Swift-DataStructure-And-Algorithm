//
//  main.swift
//  PushAlgorithm
//
//  Created by 이영재 on 2022/04/30.
//MARK: - 밀기 알고리즘

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    let q: Int = input.map { Int($0) }[2] ?? 0
    var answer: String = ""
    var array:[[Int]] = Array(repeating: Array(repeating: 0, count: m + 10), count: n + 10)
    
    for i in stride(from: 1, through: n, by: 1) {
        guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
        let numbers: [Int] = inputArray.map { Int($0) ?? 0 }
        
        for j in stride(from: 1, through: m, by: 1) {
            array[i][j] = numbers[j - 1]
        }
    }
    
    //MARK: - Process
    for _ in 0..<q {
        guard let data: [String] = readLine()?.components(separatedBy: " ") else { return }
        let f: Int = data.map { Int($0) }[0] ?? 0
        let x: Int = data.map { Int($0) }[1] ?? 0
        let y: Int = data.map { Int($0) }[2] ?? 0
        
        switch x {
        case 1:
            for _ in 0..<y {
                let last: Int = array[f + 1][m]
                
                for i in stride(from: m, to: 1, by: -1) {
                    array[f + 1][i] = array[f + 1][i - 1]
                }
                
                array[f + 1][1] = last
            }
        case 2:
            for _ in 0..<y {
                let first: Int = array[f + 1][1]
                
                for i in stride(from: 1, to: m, by: 1) {
                    array[f + 1][i] = array[f + 1][i + 1]
                }
                
                array[f + 1][m] = first
            }
        default:
            break
        }
        
        for i in stride(from: 1, to: m, by: 1) {
            answer += "\(array[f + 1][i]) "
        }
        answer += "\(array[f + 1][m])\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
