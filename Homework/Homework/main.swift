//
//  main.swift
//  Homework
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 과제물 망치기

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str = readLine() else { return }
    var result: String = ""
    
    //MARK: - Process
    for char in str {
        if char == " " {
            continue
        }
        
        result += "\(char)"
    }
    
    //MARK: - Output
    print(result)
}
solution()
