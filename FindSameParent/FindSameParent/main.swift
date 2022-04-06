//
//  main.swift
//  FindSameParent
//
//  Created by 이영재 on 2022/04/06.
//MARK: - 공통 조상 찾기

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = input.map { Int($0) }[0] ?? 0
    var X: Int = input.map { Int($0) }[1] ?? 0
    var Y: Int = input.map { Int($0) }[2] ?? 0
    var parent: [Int] = Array(repeating: 0, count: n + 10)
    var check: [Bool] = Array(repeating: false, count: n + 10)
    
    //MARK: - Process
    for _ in 0..<n - 1 {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        parent[b] = a
    }
    
    while X != 0 {
        check[X] = true
        X = parent[X]
    }
    
    while Y != 0 {
        if check[Y] {
            break
        }
        Y = parent[Y]
    }
    
    //MARK: - Output
    print(Y)
}
solution()
