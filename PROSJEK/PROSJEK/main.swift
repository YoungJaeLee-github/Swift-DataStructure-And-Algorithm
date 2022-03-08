//
//  main.swift
//  PROSJEK
//
//  Created by 이영재 on 2022/03/08.
//MARK: - PROSJEK

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let B: [Int] = input.map { Int($0) ?? 0 }
    var A: [Int] = Array(repeating: 0, count: N + 10)
    var answer: String = ""
    
    //MARK: - Process
    A[0] = B[0]
    for i in 1..<N {
        A[i] = B[i] * (i + 1)
        
        for j in 0...(i - 1) {
            A[i] -= A[j]
        }
    }
    
    for i in 0..<(N - 1) {
        answer += "\(A[i]) "
    }
    answer += "\(A[N - 1])"
    
    //MARK: - Output
    print(answer)
}
solution()
