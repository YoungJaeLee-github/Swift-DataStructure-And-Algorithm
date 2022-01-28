//
//  main.swift
//  Offset
//
//  Created by 이영재 on 2022/01/28.
//MARK: - offset

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    var answer: String = ""
    let row: Int = 5
    let column: Int = 5
    let maxNumber: Int = 9
    var array: Array<Array<Int>> = Array(repeating: Array(repeating: maxNumber, count: column + 2), count: row + 2)
    
    //MARK: - process
    for i in 1...row {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        
        for j in 1...column {
            let inputArray: Array<Int> = input.map { Int($0) ?? 0}
            array[i][j] = inputArray[j - 1]
        }
    }
    
    for i in 1...row {
        for j in 1...column {
            var biggerCount: Int = 0
            
            //상
            biggerCount += array[i][j] < array[i - 1][j] ? 1 : 0
            
            //하
            biggerCount += array[i][j] < array[i + 1][j] ? 1 : 0
            
            //좌
            biggerCount += array[i][j] < array[i][j - 1] ? 1 : 0
            
            //우
            biggerCount += array[i][j] < array[i][j + 1] ? 1 : 0
            
            answer += biggerCount == 4 ? "* " : "\(array[i][j]) "
        }
        answer += "\n"
    }
    
    //MARK: - output
    print(answer)
}
solution()
