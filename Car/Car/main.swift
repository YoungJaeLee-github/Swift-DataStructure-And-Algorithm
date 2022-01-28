//
//  main.swift
//  Car
//
//  Created by 이영재 on 2022/01/28.
//MARK: - car

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let date = Int(readLine() ?? "0") else { return }
    guard let inputCarNumbers = readLine()?.components(separatedBy: " ") else { return }
    let carNumbers: Array<Int> = inputCarNumbers.map { Int($0) ?? 0 }
    var result: Int = 0
    
    //MARK: - process
    for carNumber in carNumbers {
        result += date == carNumber ? 1 : 0
    }
    
    //MARK: - output
    print(result)
}
solution()

