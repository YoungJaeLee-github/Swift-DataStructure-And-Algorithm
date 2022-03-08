//
//  main.swift
//  CombinationZero
//
//  Created by 이영재 on 2022/03/08.
//MARK: - combinationzero

//MARK: - Framework
import Foundation

//MARK: - Function
func getNumberTwoCount(_ number: Int) -> Int {
    var numberTwo = 2
    var count: Int = 0
    
    while numberTwo <= number {
        count += number / numberTwo
        numberTwo *= 2
    }
    
    return count
}

func getNumberFiveCount(_ number: Int) -> Int {
    var numberFive: Int = 5
    var count: Int = 0
    
    while numberFive <= number {
        count += number / numberFive
        numberFive *= 5
    }
    
    return count
}

func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var answer: Int = 0
    var numberTwoCountN: Int = 0
    var numberFiveCountN: Int = 0
    var numberTwoCountM: Int = 0
    var numberFiveCountM: Int = 0
    var numberTwoCountNM: Int = 0
    var numberFiveCountNM: Int = 0
    var numberTwoCount: Int = 0
    var numberFiveCount: Int = 0
    
    //MARK: - Process
    numberTwoCountN = getNumberTwoCount(n)
    numberFiveCountN = getNumberFiveCount(n)
    numberTwoCountM = getNumberTwoCount(m)
    numberFiveCountM = getNumberFiveCount(m)
    numberTwoCountNM = getNumberTwoCount(n - m)
    numberFiveCountNM = getNumberFiveCount(n - m)
    
    numberTwoCount = numberTwoCountN - numberTwoCountM - numberTwoCountNM
    numberFiveCount = numberFiveCountN - numberFiveCountM - numberFiveCountNM
    answer = numberTwoCount > numberFiveCount ? numberFiveCount : numberTwoCount
    
    //MARK: - Output
    print(answer)
}
solution()
