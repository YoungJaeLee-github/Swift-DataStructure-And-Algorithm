//
//  main.swift
//  Eratos
//
//  Created by 이영재 on 2022/04/18.
//MARK: - 에라토스테네스의 체

//MARK: - Framework
import Foundation

//MARK: - Variable
var candidates: [Int] = []

//MARK: - Function
func getEratos(_ number: Int) -> Void {
    for i in 2...number {
        for j in stride(from: i * 2, through: number, by: i) {
            if candidates[j] == 0 {
                continue
            }
            candidates[j] = 0
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    candidates = Array(repeating: 0, count: N + 10)
    
    for i in 2...N {
        candidates[i] = i
    }
    
    //MARK: - Process
    getEratos(N)
    
    //MARK: - Output
    for i in 1...N {
        if candidates[i] == 0 {
            continue
        }
        
        print("\(candidates[i]) ", terminator: "")
    }
}
solution()
