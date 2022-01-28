//
//  main.swift
//  ExchangeNumber
//
//  Created by 이영재 on 2022/01/24.
//MARK: - 두 수 교환하기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    //MARK: - process
    var A: Int = input.map { Int($0) }[0] ?? 0
    var B: Int = input.map { Int($0) }[1] ?? 0
    var temp: Int = 0
    temp = A
    A = B
    B = temp
    
    //MARK: - output
    print(A, B, separator: " ")
}
solution()
