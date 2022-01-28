//
//  main.swift
//  MaxOfArray
//
//  Created by 이영재 on 2022/01/28.
//MARK: - maxofarr

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    let row: Int = 9
    let column: Int = 9
    var max: Int = 0
    var maxRow: Int = 0
    var maxColumn: Int = 0
    var array: Array<Array<Int>> = []
    
    //MARK: - process
    for i in 0..<row {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        let inputArray: Array<Int> = input.map { Int($0) ?? 0}
        array.append(inputArray)
        
        for j in 0..<column {
            if max < inputArray[j] {
                max = inputArray[j]
                maxRow = i + 1
                maxColumn = j + 1
            }
        }
    }
    
    //MARK: - output
    print(max, "\(maxRow) \(maxColumn)", separator: "\n")
}
solution()

