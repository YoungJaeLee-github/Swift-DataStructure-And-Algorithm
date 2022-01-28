//
//  main.swift
//  KOINumber
//
//  Created by 이영재 on 2022/01/28.
//MARK: - 검증수

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let numberCount: Int = 6
    var sum: Int = 0
    var result: Int = 0
    let temp: Array<Int> = input.map { Int($0) ?? 0}
    var KOINumber: Array<Int> = Array(repeating: 0, count: numberCount + 1)
    
    //MARK: - process
    for i in 0..<numberCount - 1 {
        KOINumber[i + 1] = temp[i]
        sum += temp[i] * temp[i]
    }
    KOINumber[numberCount] = sum % 10
    result = KOINumber[numberCount]
    
    //MARK: - output
    print(result)
}
solution()

