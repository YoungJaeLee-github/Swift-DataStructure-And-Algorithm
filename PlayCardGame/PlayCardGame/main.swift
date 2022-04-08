//
//  main.swift
//  PlayCardGame
//
//  Created by 이영재 on 2022/04/08.
//MARK: - 카드 놀이

//MARK: - Framework
import Foundation

//MARK: - Function
func getMax(_ array: [Int]) -> Int {
    var result: Int = 0
    for number in array {
        result = result < number ? number : result
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let baseCondition: Int = 3
    var result: Int = 0
    let cards: [Int] = inputArray.map { Int($0) ?? 0 }
    var cases: [Int] = Array(repeating: 0, count: baseCondition)
    
    //MARK: - Process
    //1. 부분 문제를 정의한다.
    //max(T[0], T[1], T[2]) = 주어진 카드에서 연속해서 최대 2장씩 뽑았을 때, 최대값
    
    //2. 점화식을 세운다.
    //T[0] = i번째 카드를 뽑지 않은 경우, 이전 경우에서 최대값
    //T[1] = i번째 카드만 뽑은 경우
    //T[2] = i번째 카드 + i - 1번째 카드 두장을 뽑은 경우
    //max(T[0], T[1], T[2])
    cases[0] = 0
    cases[1] = cards[0]
    cases[2] = cases[0] + cards[0]
    
    for i in 1..<N {
        let choiceNoting, choiceOne, choiceTwo: Int
        choiceNoting = getMax(cases)
        choiceOne = cards[i] + cases[0]
        choiceTwo = cards[i] + cases[1]
        
        
        cases[0] = choiceNoting
        cases[1] = choiceOne
        cases[2] = choiceTwo
    }
    
    result = getMax(cases)
    
    //MARK: - Output
    print(result)
}
solution()
