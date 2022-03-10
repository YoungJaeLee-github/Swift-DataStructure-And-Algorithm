//
//  main.swift
//  BigNumberSummation
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 큰 자릿수 덧셈

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let numberOne: String = readLine() else { return }
    guard let numberTwo: String = readLine() else { return }
    var sum: [Int] = []
    var bigNumber: [Int] = []
    var smallNumber: [Int] = []
    var smallNumberIndex: Int = 0
    var flag: Bool = false
    var answer: String = ""
    
    //MARK: - Process
    if numberOne.count < numberTwo.count {
        flag = true
    }
    
    if (flag) {
        sum = Array(repeating: 0, count: numberTwo.count)
        bigNumber = Array(repeating: 0, count: numberTwo.count)
        smallNumber = Array(repeating: 0, count: numberTwo.count)

        for i in stride(from: numberTwo.count - 1, through: 0, by: -1) {
            bigNumber[i] = Int(numberTwo[numberTwo.index(numberTwo.startIndex, offsetBy: i)].asciiValue! - 48)
        }
        
        smallNumberIndex = numberOne.count - 1
        for i in stride(from: numberTwo.count - 1, through: numberTwo.count - numberOne.count, by: -1) {
            smallNumber[i] = Int(numberOne[numberOne.index(numberOne.startIndex, offsetBy: smallNumberIndex)].asciiValue! - 48)
            
            smallNumberIndex -= 1
        }
        
        for i in 0..<numberTwo.count {
            sum[i] = bigNumber[i] + smallNumber[i]
        }
    } else {
        sum = Array(repeating: 0, count: numberOne.count)
        bigNumber = Array(repeating: 0, count: numberOne.count)
        smallNumber = Array(repeating: 0, count: numberOne.count)
        
        for i in stride(from: numberOne.count - 1, through: 0, by: -1) {
            bigNumber[i] = Int(numberOne[numberOne.index(numberOne.startIndex, offsetBy: i)].asciiValue! - 48)
        }
        
        smallNumberIndex = numberTwo.count - 1
        for i in stride(from: numberOne.count - 1, through: numberOne.count - numberTwo.count, by: -1) {
            smallNumber[i] = Int(numberTwo[numberTwo.index(numberTwo.startIndex, offsetBy: smallNumberIndex)].asciiValue! - 48)
            
            smallNumberIndex -= 1
        }
        
        for i in 0..<numberOne.count {
            sum[i] = bigNumber[i] + smallNumber[i]
        }
    }
    
    for i in stride(from: sum.count - 1, to: 0, by: -1) {
        if sum[i] >= 10 {
            sum[i - 1] += 1
            sum[i] %= 10
        }
    }
    
    for number in sum {
        answer += "\(number)"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
