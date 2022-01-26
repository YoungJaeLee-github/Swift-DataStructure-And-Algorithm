//
//  main.swift
//  A+B
//
//  Created by 이영재 on 2022/01/24.
//MARK: - A + B

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solutions() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else {
        return
    }
    
    //MARK: - process
    let A: Int = input.map { Int($0) }[0] ?? 0
    let B: Int = input.map { Int($0) }[1] ?? 0
    let result: Int = A + B
    
    //MARK: - output
    print(result)
}

solutions()

