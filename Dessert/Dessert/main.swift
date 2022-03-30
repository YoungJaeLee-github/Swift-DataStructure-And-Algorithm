//
//  main.swift
//  Dessert
//
//  Created by 이영재 on 2022/03/30.
//MARK: - dessert

//MARK: - Framework
import Foundation

//MARK: - Variable
var count: Int = 0

//MARK: - Function
func getDessert(_ current: Int, _ N: Int, _ result: inout [Int]) -> Void {
    if current >= N - 1 {
        var answer: String = ""
        var expression: String = ""
        var number: String = ""
        var oper: Int = 0
        var sum: Int64 = 0
        
        for i in 0..<N {
            answer += "\(i + 1)"
            expression += "\(i + 1)"
            
            switch result[i] {
            case -1:
                answer += " + "
                expression += "+"
            case -2:
                answer += " - "
                expression += "-"
            case -3:
                answer += " . "
            default:
                break
            }
        }
        
        for data in expression {
            if data == "+" || data == "-" {
                if oper == 0 {
                    sum = Int64(number) ?? 0
                } else {
                    switch oper {
                    case -1:
                        sum += Int64(number) ?? 0
                    case -2:
                        sum -= Int64(number) ?? 0
                    default:
                        break
                    }
                }
                oper = data == "+" ? -1 : -2
                number = ""
            } else {
                number += "\(data)"
            }
        }
        
        switch oper {
        case -1:
            sum += Int64(number) ?? 0
        case -2:
            sum -= Int64(number) ?? 0
        default:
            sum = Int64(number) ?? 0
        }
        
        if sum == 0 {
            if count < 20 {
                print(answer)
            }
            count += 1
        }
    } else {
        for i in stride(from: -1, through: -3, by: -1) {
            result[current] = i
            getDessert(current + 1, N, &result)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var result: [Int] = Array(repeating: 0, count: N)
    
    //MARK: - Process & Output
    getDessert(0, N, &result)
    print(count)
}
solution()
