//
//  main.swift
//  Division
//
//  Created by 이영재 on 2022/03/30.
//MARK: - division

//MARK: - Framework
import Foundation

//MARK: - Variable
var count: Int = 0

//MARK: - Function
func getDivision(_ currentSum: Int, _ current: Int, _ n: Int, _ result: inout [Int]) -> Void {
    if currentSum == n {
        var answer: String = ""
        for i in 0..<current - 1 {
            answer += "\(result[i])+"
        }
        answer += "\(result[current - 1])"
        print(answer)
        count += 1
    } else {
        let currentNumber: Int = current == 0 ? n - 1 : n - currentSum
        for i in stride(from: currentNumber, through: 1, by: -1) {
            if current > 0 && result[current - 1] < i {
                continue
            }
            result[current] = i
            getDivision(currentSum + i, current + 1, n, &result)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var result: [Int] = Array(repeating: 0, count: n + 10)
    
    //MARK: - Process & Output
    getDivision(0, 0, n, &result)
    print(count)
}
solution()
