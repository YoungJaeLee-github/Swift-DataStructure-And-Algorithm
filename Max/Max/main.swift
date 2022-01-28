//
//  main.swift
//  Max
//
//  Created by 이영재 on 2022/01/27.
//MARK: - 최댓값

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    let numberCount: Int = 9
    var max: Int = 0
    var maxIndex: Int = 0
    
    //MARK: - process
    for i in 1...numberCount {
        let number: Int = Int(readLine() ?? "0") ?? 0
        if max < number {
            max = number
            maxIndex = i
        }
    }
    
    //MARK: - output
    print(max, maxIndex, separator: "\n")
}
solution()

