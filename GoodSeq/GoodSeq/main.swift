//
//  main.swift
//  GoodSeq
//
//  Created by 이영재 on 2022/04/07.
//MARK: - goodseq

//MARK: - Framework
import Foundation

//MARK: - Variable
var isFinished: Bool = false

//MARK: - Function
func isPossible(_ result: [Int], _ current: Int, _ interval: Int) -> Bool {
    var flag: Bool = false
    
    for i in 0..<interval {
        if result[current - i] != result[current - i - interval] {
            flag = true
            break
        }
    }
    
    return flag
}

func getGoodSeq(_ result: inout [Int], _ N: Int, _ current: Int) -> Void {
    if isFinished { return }
    
    if current >= N {
        var answer: String = ""
        for number in result {
            answer += "\(number)"
        }
        print(answer)
        isFinished = true
    } else {
        for i in 1...3 {
            var flag: Bool = false
            result[current] = i
            
            for j in stride(from: 1, through: (current + 1) / 2, by: 1) {
                if !isPossible(result, current, j) {
                    flag = true
                    break
                }
            }
            
            if !flag {
                getGoodSeq(&result, N, current + 1)
            }
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var result: [Int] = Array(repeating: 0, count: N)
    
    //MARK: - Process & Output
    getGoodSeq(&result, N, 0)
}
solution()
