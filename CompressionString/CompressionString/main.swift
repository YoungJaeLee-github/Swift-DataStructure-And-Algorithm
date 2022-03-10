//
//  main.swift
//  CompressionString
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 문자열 압축

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str = readLine() else { return }
    var result: String = ""
    var count: Int = 1
    
    //MARK: - Process
    for i in 0..<str.count - 1 {
        if str[str.index(str.startIndex, offsetBy: i)] == str[str.index(str.startIndex, offsetBy: i + 1)] {
            count += 1
        } else {
            result += count == 1 ? "\(str[str.index(str.startIndex, offsetBy: i)])" : "\(count)\(str[str.index(str.startIndex, offsetBy: i)])"
            count = 1
        }
    }
    result += count == 1 ? "\(str[str.index(before: str.endIndex)])" : "\(count)\(str[str.index(before: str.endIndex)])"
    
    //MARK: - Output
    print(result)
}
solution()
