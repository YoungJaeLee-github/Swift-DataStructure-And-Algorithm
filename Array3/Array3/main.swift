//
//  main.swift
//  Array3
//
//  Created by 이영재 on 2022/01/28.
//MARK: - Array 3

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let N: Int = Int(input) ?? 0
    var startNumber: Int = 1
    var array: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: N), count: N)
    
    //MARK: - process
    for i in 0..<N {
        for j in 0...i {
            array[j][i - j] = startNumber
            startNumber += 1
        }
    }
    
    //MARK: - output
    for i in array {
        for j in i {
            if j == 0 {
                continue
            }
            print(j, terminator: " ")
        }
        print()
    }
}
solution()
