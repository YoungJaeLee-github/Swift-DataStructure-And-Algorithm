//
//  main.swift
//  Bingo
//
//  Created by 이영재 on 2022/02/15.
//MARK: - Bingo

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct Bingo {
    //MARK: - Properties
    var row: Int
    var column: Int
    var bingoBoard: Array<Array<Int>>
    
    //MARK: - Initializer
    init() {
        self.row = 5
        self.column = 5
        self.bingoBoard = []
    }
}

//MARK: - Functions
func removeNumber(_ board: inout Array<Array<Int>>, _ toRemoveNumber: Int) -> Void {
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            board[i][j] = board[i][j] == toRemoveNumber ? 0 : board[i][j]
        }
    }
}

func checkDiagonal(_ board: inout Array<Array<Int>>) -> Int {
    var zeroCount: Int = 0
    
    for i in 0..<board.count {
        zeroCount += board[i][i] == 0 ? 1 : 0
    }
    
    return zeroCount == 5 ? 1 : 0
}

func checkDiagonalTwo(_ board: inout Array<Array<Int>>) -> Int {
    var zeroCount: Int = 0
    
    for i in 0..<board.count {
        zeroCount += board[i][(board.count - 1) - i] == 0 ? 1 : 0
    }
    
    return zeroCount == 5 ? 1 : 0
}

func checkRow(_ board: inout Array<Array<Int>>, _ bingoCount: Int) -> Int {
    var result: Int = bingoCount
    
    for i in 0..<board.count {
        var zeroCount: Int = 0
        
        for j in 0..<board[i].count {
            zeroCount += board[i][j] == 0 ? 1 : 0
        }
        
        if result >= 3 {
            break
        }
        
        if zeroCount == 5 {
            result += 1
        }
    }
    
    return result
}

func checkColumn(_ board: inout Array<Array<Int>>, _ bingoCount: Int) -> Int {
    var result: Int = bingoCount
    
    for i in 0..<board.count {
        var zeroCount: Int = 0
        
        for j in 0..<board[i].count {
            zeroCount += board[j][i] == 0 ? 1 : 0
        }
        
        if result >= 3 {
            break
        }
        
        if zeroCount == 5 {
            result += 1
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - input
    var bingo: Bingo = Bingo()
    var callNumberCount: Int = 0
    
    for _ in 0..<bingo.row {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        bingo.bingoBoard.append(input.map{ Int($0) ?? 0 })
    }
    
    //MARK: - process & output
    for _ in 0..<bingo.row {
        guard let inputCallNumber = readLine()?.components(separatedBy: " ") else { return }
        let callNumbers = inputCallNumber.map{ Int($0) ?? 0 }
        
        for callNumber in callNumbers {
            var bingoCount: Int = 0
            callNumberCount += 1
            
            //숫자를 지움
            removeNumber(&bingo.bingoBoard, callNumber)
            
            //빙고 검사(대각선 -> 반대각선 -> 가로 -> 세로)
            bingoCount += checkDiagonal(&bingo.bingoBoard)
            bingoCount += checkDiagonalTwo(&bingo.bingoBoard)
            
            bingoCount = checkRow(&bingo.bingoBoard, bingoCount)
            if bingoCount >= 3 {
                print("\n\n\(callNumberCount)")
                return
            }
            
            bingoCount = checkColumn(&bingo.bingoBoard, bingoCount)
            if bingoCount >= 3 {
                print("\n\n\(callNumberCount)")
                return
            }
        }
    }
}
solution()
