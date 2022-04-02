//
//  main.swift
//  ParenthesisString
//
//  Created by 이영재 on 2022/04/02.
//MARK: - 괄호

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str: String = readLine() else { return }
    var flag: Bool = false
    var count: Int = 0
    
    //MARK: - Process
    for char in str {
        if char == ")" {
            count -= 1
            if count < 0 {
                flag = true
                break
            }
        } else {
            count += 1
        }
    }
    flag = count == 0 ? false : true
    
    //MARK: - Output
    print(flag ? "NO" : "YES")
}
solution()
