//
//  main.swift
//  MoveAlgorithm2
//
//  Created by 이영재 on 2022/05/18.
//MARK: - 이동 알고리즘 2

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    var answer: String = ""
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
    let N: Int = input[0]
    let M: Int = input[1]
    let k: Int = input[2]
    let t: Int = input[3]
    
    var y: [Int] = Array(repeating: 0, count: k + 10)
    var x: [Int] = Array(repeating: 0, count: k + 10)
    var d: [Int] = Array(repeating: 0, count: k + 10)
    var f: [Int] = Array(repeating: 0, count: k + 10)
    
    for i in stride(from: 1, through: k, by: 1) {
        let data: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
        y[i] = data[0]
        x[i] = data[1]
        d[i] = data[2]
        f[i] = data[3]
    }
    
    //MARK: - Process
    for _ in 0..<t {
        for i in stride(from: 1, through: k, by: 1) {
            var tempF: Int = f[i]
            
            if d[i] == 0 || d[i] == 1 {
                tempF %= (N - 1) * 2
            } else {
                tempF %= (M - 1) * 2
            }
            
            while tempF > 0 {
                switch d[i] {
                    case 0:
                        if y[i] - tempF >= 1 {
                            y[i] -= tempF
                            tempF = 0
                        } else {
                            tempF -= (y[i] - 1)
                            y[i] = 1
                            d[i] = 1
                        }
                    case 1:
                        if y[i] + tempF <= N {
                            y[i] += tempF
                            tempF = 0
                        } else {
                            tempF -= (N - y[i])
                            y[i] = N
                            d[i] = 0
                        }
                    case 2:
                        if x[i] - tempF >= 1 {
                            x[i] -= tempF
                            tempF = 0
                        } else {
                            tempF -= (x[i] - 1)
                            x[i] = 1
                            d[i] = 3
                        }
                    case 3:
                        if x[i] + tempF <= M {
                            x[i] += tempF
                            tempF = 0
                        } else {
                            tempF -= (M - x[i])
                            x[i] = M
                            d[i] = 2
                        }
                    default:
                        break
                }
            }
        }
    }
    
    for i in stride(from: 1, through: k, by: 1) {
        answer += "\(y[i]) \(x[i])\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
