//
//  main.swift
//  Factorization
//
//  Created by 이영재 on 2022/03/05.
//MARK: - 소인수 분해

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard var N: Int = Int(readLine() ?? "0") else { return }
    var primeNumber: Int = 2
    var candidates: Array<Int> = []
    var answer: String = ""
    
    //MARK: - Process
    while N > 1 {
        while N % primeNumber == 0 {
            candidates.append(primeNumber)
            N /= primeNumber
        }
        primeNumber += 1
    }
    
    for i in 0..<candidates.count - 1 {
        answer += "\(candidates[i]) X "
    }
    answer += "\(candidates[candidates.count - 1])"
    
    //MARK: - Output
    print(answer)
}
solution()
