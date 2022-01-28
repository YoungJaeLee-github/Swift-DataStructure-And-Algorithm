//
//  main.swift
//  Rook
//
//  Created by 이영재 on 2022/01/28.
//MARK: - rook

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct KingInfo {
    //MARK: - Properties
    var row: Int
    var column: Int
    
    //MARK: - Initializer
    init(_ row: Int, _ column: Int) {
        self.row = row
        self.column = column
    }
}

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    var isPossible: Bool = false
    var answer: Int = 0
    let row: Int = 8
    let column: Int = 8
    var chessBoard: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: column + 10), count: row + 10)
    var kingInfo: KingInfo = KingInfo(0, 0)
    
    //MARK: - process
    for i in 1...row {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        let inputArray: Array<Int> = input.map { Int($0) ?? 0}
        
        for j in 1...column {
            chessBoard[i][j] = inputArray[j - 1]
            if inputArray[j - 1] == 1 {
                kingInfo = KingInfo(i, j)
            }
        }
    }
    
    //Top
    for i in stride(from: kingInfo.row - 1, through: 1, by: -1) {
        if chessBoard[i][kingInfo.column] == 3 {
            break
        }
        
        if chessBoard[i][kingInfo.column] == 2 {
            isPossible = true
            break
        }
    }
    
    //Bottom
    for i in kingInfo.row + 1...row {
        if chessBoard[i][kingInfo.column] == 3 {
            break
        }
        
        if chessBoard[i][kingInfo.column] == 2 {
            isPossible = true
            break
        }
    }
    
    //Left
    for i in stride(from: kingInfo.column - 1, through: 1, by: -1) {
        if chessBoard[kingInfo.row][i] == 3 {
            break
        }
        
        if chessBoard[kingInfo.row][i] == 2 {
            isPossible = true
            break
        }
    }
    
    //Right
    for i in kingInfo.column + 1...column {
        if chessBoard[kingInfo.row][i] == 3 {
            break
        }
        
        if chessBoard[kingInfo.row][i] == 2 {
            isPossible = true
            break
        }
    }
    answer = isPossible ? 1 : 0
    
    //MARK: - output
    print(answer)
}
solution()

