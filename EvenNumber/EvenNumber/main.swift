//
//  main.swift
//  EvenNumber
//
//  Created by 이영재 on 2022/01/24.
//MARK: - 짝수 판별하기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    //MARK: - process
    let N: Int = input.map { Int($0) }[0] ?? 0
    
    //MARK: - output
    print(N % 2 == 0 ? "even" : "not even")
}
solution()

