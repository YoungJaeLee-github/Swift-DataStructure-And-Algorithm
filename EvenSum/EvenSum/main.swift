//
//  main.swift
//  EvenSum
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 짝수의 합 구하기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let N: Int = Int(input) ?? 0
    var sum: Int = 0
    
    //MARK: - process
    for i in 1...N {
        sum += i % 2 == 0 ? i : 0
    }
    
    //MARK: - output
    print(sum)
}
solution()

