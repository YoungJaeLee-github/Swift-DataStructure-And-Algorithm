//
//  main.swift
//  Array1
//
//  Created by 이영재 on 2022/01/28.
//MARK: - Array 1

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    var startNumber: Int = 1
    
    //MARK: - process
    for _ in 0..<N {
        for _ in 0..<M - 1 {
            print(startNumber, terminator: " ")
            startNumber += 1
        }
        print(startNumber)
        startNumber += 1
    }
    
    //MARK: - output
}
solution()
