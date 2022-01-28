//
//  main.swift
//  FlipArray2
//
//  Created by 이영재 on 2022/01/28.
//MARK: - 행렬 뒤집기 2

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    let row: Int = 10
    let column: Int = 10
    var array: Array<Array<Int>> = []
    var answer: String = ""
    
    //MARK: - process
    for _ in 0..<row {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        
        let inputArray: Array<Int> = input.map { Int($0) ?? 0}
        array.append(inputArray)
    }
    
    for i in 0...N-1 {
        //행 뒤집기
        for j in 0..<column {
            array[i][j] = array[i][j] == 0 ? 1 : 0
        }
        
        //열 뒤집기
        for j in 0..<row {
            if i == j {
                continue
            }
            array[j][i] = array[j][i] == 0 ? 1 : 0
        }
    }
    
    for i in 0..<row {
        for j in 0..<column - 1 {
            answer += "\(array[i][j]) "
        }
        answer += "\(array[i][column - 1])\n"
    }
    
    //MARK: - output
    print()
    print(answer)
}
solution()

