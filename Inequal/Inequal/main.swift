//
//  main.swift
//  Inequal
//
//  Created by 이영재 on 2022/03/30.
//MARK: - inequal

//MARK: - Framework
import Foundation

//MARK: - Variable
var flag: Bool = false

//MARK: - Function
func getMaxInequal(_ A: [String], _ current: Int, _ k: Int, _ lowerBound: Int, _ upperBound: Int, _ result: inout [Int], _ check: inout [Bool]) -> Void {
    if flag {
        return
    }
    
    if current >= k + 1 {
        var answer: String = ""
        for number in result {
            answer += "\(number)"
        }
        print(answer)
        flag = true
    } else {
        for i in stride(from: upperBound, through: lowerBound, by: -1) {
            if !check[i] {
                var isPossible: Bool = true
                
                if current == 0 {
                    isPossible = true
                } else {
                    switch A[current - 1] {
                    case "<":
                        isPossible = result[current - 1] > i ? false : true
                    case ">":
                        isPossible = result[current - 1] < i ? false : true
                    default:
                        break
                    }
                }
                
                if isPossible {
                    result[current] = i
                    check[i] = true
                    getMaxInequal(A, current + 1, k, lowerBound, upperBound, &result, &check)
                    check[i] = false
                }
            }
        }
    }
}

func getMinInequal(_ A: [String], _ current: Int, _ k: Int, _ lowerBound: Int, _ upperBound: Int, _ result: inout [Int], _ check: inout [Bool]) -> Void {
    if flag {
        return
    }
    
    if current >= k + 1 {
        var answer: String = ""
        for number in result {
            answer += "\(number)"
        }
        print(answer)
        flag = true
    } else {
        for i in lowerBound...upperBound {
            if !check[i] {
                var isPossible: Bool = true
                
                if current == 0 {
                    isPossible = true
                } else {
                    switch A[current - 1] {
                    case "<":
                        isPossible = result[current - 1] > i ? false : true
                    case ">":
                        isPossible = result[current - 1] < i ? false : true
                    default:
                        break
                    }
                }
                
                if isPossible {
                    result[current] = i
                    check[i] = true
                    getMinInequal(A, current + 1, k, lowerBound, upperBound, &result, &check)
                    check[i] = false
                }
            }
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let k: Int = Int(readLine() ?? "0") else { return }
    guard let A: [String] = readLine()?.components(separatedBy: " ") else { return }
    let lowerBound: Int = 0
    let upperBound: Int = 9
    
    var result: [Int] = Array(repeating: 0, count: k + 1)
    var check: [Bool] = Array(repeating: false, count: upperBound + 1)
    
    //MARK: - Process & Output
    getMaxInequal(A, 0, k, lowerBound, upperBound, &result, &check)
    
    check = Array(repeating: false, count: upperBound + 1)
    flag = false
    
    getMinInequal(A, 0, k, lowerBound, upperBound, &result, &check)
}
solution()
