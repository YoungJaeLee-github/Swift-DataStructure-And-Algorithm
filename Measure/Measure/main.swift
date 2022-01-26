//
//  main.swift
//  Measure
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 약수 구하기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    let N: Int = input.map { Int($0) }[0] ?? 0
    let K: Int = input.map { Int($0) }[1] ?? 0
    var count: Int = 0
    var answer: Int = 0
    
    //MARK: - process
    for i in 1...N {
        count += N % i == 0 ? 1 : 0
        
        if count == K {
            answer = i
            break
        }
    }
    
    //MARK: - output
    print(answer)
}
solution()
