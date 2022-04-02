//
//  main.swift
//  ParenthesisValue
//
//  Created by 이영재 on 2022/04/02.
//MARK: - 괄호의 값

//MARK: - Framework
import Foundation

//MARK: - Function
func isVPS(_ str: String) -> Bool {
    let first: Character = str[str.startIndex]
    if first == ")" || first == "]" {
        return false
    }
    
    var stack: [Int] = Array(repeating: 0, count: str.count + 10)
    var count: Int = 0
    
    stack[count] = first == "(" ? 1 : 2
    count += 1
    
    for i in 1..<str.count {
        if str[str.index(str.startIndex, offsetBy: i)] == "(" {
            stack[count] = 1
            count += 1
        } else if str[str.index(str.startIndex, offsetBy: i)] == "[" {
            stack[count] = 2
            count += 1
        } else {
            if str[str.index(str.startIndex, offsetBy: i)] == ")" {
                if count <= 0 {
                    return false
                }
                
                if stack[count - 1] == 2 {
                    return false
                }
                
                count -= 1
            } else {
                if count <= 0 {
                    return false
                }
                
                if stack[count - 1] == 1 {
                    return false
                }
                
                count -= 1
            }
        }
    }
    
    return count == 0 ? true : false
}

func getParenthesisValue(_ str: String) -> Int {
    var result: Int = 0
    
    if !isVPS(str) {
        result = 0
    } else {
        var stack: [Int] = Array(repeating: 0, count: str.count + 10)
        var count: Int = 0
        
        for char in str {
            if char == "(" {
                stack[count] = -1
                count += 1
            } else if char == "[" {
                stack[count] = -2
                count += 1
            } else {
                var sum: Int = 0
                if char == ")" {
                    while count > 0 && stack[count - 1] != -1 {
                        sum += stack[count - 1]
                        count -= 1
                    }
                    count -= 1
                    
                    stack[count] = sum == 0 ? 2 : sum * 2
                    count += 1
                } else {
                    while count > 0 && stack[count - 1] != -2 {
                        sum += stack[count - 1]
                        count -= 1
                    }
                    count -= 1
                    
                    stack[count] = sum == 0 ? 3 : sum * 3
                    count += 1
                }
            }
        }
        
        while count > 0 {
            result += stack[count - 1]
            count -= 1
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let str = readLine() else { return }
    
    //MARK: - Process
    let result: Int = getParenthesisValue(str)
    
    //MARK: - Output
    print(result)
}
solution()
