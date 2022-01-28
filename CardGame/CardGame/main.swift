//
//  main.swift
//  CardGame
//
//  Created by 이영재 on 2022/01/28.
//MARK: - Card game

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let inputA = readLine()?.components(separatedBy: " ") else { return }
    guard let inputB = readLine()?.components(separatedBy: " ") else { return }
    
    let cardCount: Int = 10
    let A: Array<Int> = inputA.map { Int($0) ?? 0}
    let B: Array<Int> = inputB.map { Int($0) ?? 0}
    var countA: Int = 0
    var countB: Int = 0
    
    //MARK: - process
    for i in 0..<cardCount {
        countA += A[i] > B[i] ? 1 : 0
        countB += B[i] > A[i] ? 1 : 0
    }
    
    //MARK: - output
    if countA > countB {
        print("A")
    } else if countB > countA {
        print("B")
    } else {
        print("D")
    }
}
solution()
