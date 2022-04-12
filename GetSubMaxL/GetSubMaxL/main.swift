//
//  main.swift
//  GetSubMaxL
//
//  Created by 이영재 on 2022/04/12.
//MARK: - 연속 부분 최대합 L

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let array: [Int] = inputArray.map { Int($0) ?? 0 }
    var table: [Int] = Array(repeating: 0, count: n)
    var result: Int = 0
    
    //MARK: - Process
    table[0] = array[0]
    result = table[0]
    
    for i in 1..<n {
        table[i] = array[i] < table[i - 1] + array[i] ? table[i - 1] + array[i] : array[i]
    }
    
    for number in table {
        result = result < number ? number : result
    }
    
    //MARK: - Output
    print(result)
}
solution()
