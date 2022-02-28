//
//  main.swift
//  Knumber
//
//  Created by 이영재 on 2022/02/28.
//MARK: - k번째 큰 수 찾기

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
    
    let N: Int = input.map { Int($0) }[0] ?? 0
    let k: Int = input.map { Int($0) }[1] ?? 0
    
    //MARK: - process
    let sortedArray: Array<Int> = inputArray.map { Int($0) ?? 0 }.sorted { $0 < $1 }
    let result: Int = sortedArray[N - k]
    
    //MARK: - output
    print(result)
}
solution()
