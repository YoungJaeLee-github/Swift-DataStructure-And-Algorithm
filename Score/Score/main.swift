//
//  main.swift
//  Score
//
//  Created by 이영재 on 2022/01/27.
//MARK: - 점수 계산

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    guard let inputProblems = readLine()?.components(separatedBy: " ") else { return }
    
    let N: Int = Int(input) ?? 0
    let problems: Array<Int> = inputProblems.map { Int($0) ?? 0 }
    var score: Array<Int> = []
    
    //MARK: - process
    score.append(problems[0])
    for i in 1..<N {
        score.append(problems[i] == 0 ? 0 : score[i - 1] + 1)
    }
    
    let sum: Int = score.reduce(0) { $0 + $1 }
    
    //MARK: - output
    print(sum)
}
solution()

