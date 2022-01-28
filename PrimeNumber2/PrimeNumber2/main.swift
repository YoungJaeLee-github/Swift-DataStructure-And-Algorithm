//
//  main.swift
//  PrimeNumber2
//
//  Created by 이영재 on 2022/01/27.
//MARK: - 소수 판별 2

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func getPrimeNumbers(_ m: Int, _ candidates: inout Array<Int>) -> Void {
    for i in 2...m {
        for j in stride(from: i * 2, through: m, by: i) {
            if candidates[j] == 0 {
                continue
            }
            candidates[j] = 0
        }
    }
}

func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var answer: String = ""
    var candidates: Array<Int> = Array(repeating: 0, count: m + 10)
    
    for i in 2...m {
        candidates[i] = i
    }
    
    //MARK: - process
    getPrimeNumbers(m, &candidates)
    for i in n..<m {
        answer += candidates[i] != 0 ? "\(candidates[i]) " : ""
    }
    answer += candidates[m] != 0 ? "\(candidates[m])" : ""
    
    //MARK: - output
    print(answer)
}
solution()

