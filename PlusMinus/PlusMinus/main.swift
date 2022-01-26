//
//  main.swift
//  PlusMinus
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 더하기 빼기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    let A: Int = input.map { Int($0) }[0] ?? 0
    let B: Int = input.map { Int($0) }[1] ?? 0
    var result: Int = 0
    
    //MARK: - process
    for i in A...B {
        result += i % 2 == 0 ? -i : i
    }
    
    //MARK: - output
    print(result)
}
solution()

