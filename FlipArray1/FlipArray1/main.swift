//
//  main.swift
//  FlipArray1
//
//  Created by 이영재 on 2022/01/28.
//MARK: - 행렬 뒤집기 1

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    let row: Int = 10
    let column: Int = 10
    var array: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: column + 10), count: row + 10)
    var answer: String = ""
    
    //MARK: - process
    for i in 1...N {
        //행 뒤집기
        for j in 1...column {
            array[i][j] = array[i][j] == 0 ? 1 : 0
        }
        
        //열 뒤집기
        for j in 1...row {
            if i == j {
                continue
            }
            array[j][i] = array[j][i] == 0 ? 1 : 0
        }
    }
    
    for i in 1...row {
        for j in 1..<column {
            answer += "\(array[i][j]) "
        }
        answer += "\(array[i][column])\n"
    }
    
    //MARK: - output
    print(answer)
}
solution()
