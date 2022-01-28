//
//  main.swift
//  Array2
//
//  Created by 이영재 on 2022/01/28.
//MARK: - Array 2

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let _: Int = input.map { Int($0) }[1] ?? 0
    var array: Array<Array<Int>> = []
    
    //MARK: - process
    for _ in 0..<N {
        guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
        array.append(inputArray.map { Int($0) ?? 0})
    }
    
    guard let inputIndex = readLine()?.components(separatedBy: " ") else { return }
    let A: Int = inputIndex.map { Int($0) }[0] ?? 0
    let B: Int = inputIndex.map { Int($0) }[1] ?? 0
    
    //MARK: - output
    print(array[A][B])
}
solution()

