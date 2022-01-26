//
//  main.swift
//  MaxOfThreeNumber
//
//  Created by 이영재 on 2022/01/24.
//MARK: - 세 개의 숫자 중 최댓값 찾기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    let a: Int = input.map { Int($0) }[0] ?? 0
    let b: Int = input.map { Int($0) }[1] ?? 0
    let c: Int = input.map { Int($0) }[2] ?? 0
    var max: Int = 0
    
    //MARK: - process
    if a >= b && a >= c {
        max = a
    } else if b >= a && b >= c {
        max = b
    } else {
        max = c
    }
    
    //MARK: - output
    print(max)
}

solution()

