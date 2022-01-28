//
//  main.swift
//  Binary
//
//  Created by 이영재 on 2022/01/27.
//MARK: - Binary

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func getBinary(_ number: Int) -> String {
    if number / 2 == 0 {
        return "1"
    }
    return "\(getBinary(number / 2))\(number % 2)"
}

func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let number: Int = Int(input) ?? 0
    var answer: String = ""
    
    //MARK: - process
    answer = getBinary(number)
    
    //MARK: - output
    print(answer)
}
solution()

