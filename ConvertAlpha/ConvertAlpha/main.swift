//
//  main.swift
//  ConvertAlpha
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 대소문자 변환

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str: String = readLine() else { return }
    var result: String = ""
    
    //MARK: - Process
    for char in str {
        if 65 <= char.asciiValue! && char.asciiValue! <= 90 {
            result += "\(Character(UnicodeScalar(char.asciiValue! + 32)))"
        } else if 97 <= char.asciiValue! && char.asciiValue! <= 122 {
            result += "\(Character(UnicodeScalar(char.asciiValue! - 32)))"
        } else {
            result += "\(char)"
        }
    }
    
    //MARK: - Output
    print(result)
}
solution()
