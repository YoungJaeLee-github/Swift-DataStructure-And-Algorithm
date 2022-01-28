//
//  main.swift
//  Eightnine
//
//  Created by 이영재 on 2022/01/28.
//MARK: - eightnine

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    var array: Array<Array<Int>> = []
    
    //MARK: - process
    for _ in 0..<N {
        guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
        array.append(inputArray.map { Int($0) ?? 0 })
    }
    
    //MARK: - output
    for i in 0..<N {
        for j in stride(from: M - 1, to: 0, by: -1) {
            print(array[i][j], terminator: " ")
        }
        print(array[i][0])
    }
}
solution()

