//
//  main.swift
//  RotationBoardRobot
//
//  Created by 이영재 on 2022/04/19.
//MARK: - 회전판과 로봇

//MARK: - Framework
import Foundation

//MARK: - Variable
var score: Int = 0

//MARK: - Function
func getMoveCount(_ K: Int, _ rotationDirection: Int, _ rotationCount: Int, _ rotationBoardIndex: Int) -> Int {
    let r: Int = rotationCount >= K ? rotationCount % K : rotationCount
    var result: Int = rotationBoardIndex
    
    switch rotationDirection {
    case 1:
        result = result - r < 0 ? K + (result - r) : result - r
    case 2:
        result = result + r >= K ? (result + r) - K : result + r
    default:
        break
    }
    
    return result
}

func getYcoordinate(_ array: inout [[Int]], _ M: Int, _ Y: Int, _ X: Int, _ moveDirection: String, _ moveCount: Int) -> Int {
    var result: Int = Y
    
    switch moveDirection {
    case "N":
        for _ in stride(from: 0, to: moveCount, by: 1) {
            if result - 1 < 1 || array[result - 1][X] == -1 {
                break
            }
            
            score += array[result][X]
            array[result][X] = 0
            
            result -= 1
        }
    case "S":
        for _ in stride(from: 0, to: moveCount, by: 1) {
            if result + 1 > M || array[result + 1][X] == -1 {
                break
            }
            
            score += array[result][X]
            array[result][X] = 0
            
            result += 1
        }
    default:
        break
    }
    
    return result
}

func getXcoordinate(_ array: inout [[Int]], _ N: Int, _ Y: Int, _ X: Int, _ moveDirection: String, _ moveCount: Int) -> Int {
    var result: Int = X
    
    switch moveDirection {
    case "E":
        for _ in stride(from: 0, to: moveCount, by: 1) {
            if result + 1 > N || array[Y][result + 1] == -1 {
                break
            }
            
            score += array[Y][result]
            array[Y][result] = 0
            
            result += 1
        }
    case "W":
        for _ in stride(from: 0, to: moveCount, by: 1) {
            if result - 1 < 1 || array[Y][result - 1] == -1 {
                break
            }
            
            score += array[Y][result]
            array[Y][result] = 0
            
            result -= 1
        }
    default:
        break
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let T: Int = Int(readLine() ?? "0") else { return }
    var x: Int = 1
    var answer: String = ""
    
    //MARK: - Process
    for _ in 0..<T {
        guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
        let N: Int = input.map { Int($0) }[0] ?? 0  //가로
        let M: Int = input.map { Int($0) }[1] ?? 0  //세로
        var X: Int = input.map { Int($0) }[2] ?? 0  //열 위치
        var Y: Int = input.map { Int($0) }[3] ?? 0  //행 위치
        var array: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 10), count: M + 10)
        
        
        for i in 1...M {
            guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
            let numbers: [Int] = inputArray.map { Int($0) ?? 0 }
            
            for j in 1...N {
                array[i][j] = numbers[j - 1]
            }
        }
        score += array[Y][X]
        array[Y][X] = 0
        
        guard let K: Int = Int(readLine() ?? "0") else { return }
        guard let inputRotationBoard: [String] = readLine()?.components(separatedBy: " ") else { return }
        let rotationBoard: [Int] = inputRotationBoard.map { Int($0) ?? 0 }
        var rotationBoardIndex: Int = 0
        
        guard let L: Int = Int(readLine() ?? "0") else { return }
        for _ in 0..<L {
            guard let data: [String] = readLine()?.components(separatedBy: " ") else { return }
            let moveDirection: String = data[0]
            let rotationDirection: Int = data.map { Int($0) }[1] ?? 0
            let rotationCount: Int = data.map { Int($0) }[2] ?? 0
            rotationBoardIndex = getMoveCount(K, rotationDirection, rotationCount, rotationBoardIndex)
            
            let moveCount: Int = rotationBoard[rotationBoardIndex]
            
            if moveDirection == "N" || moveDirection == "S" {
                Y = getYcoordinate(&array, M, Y, X, moveDirection, moveCount)
            } else {
                X = getXcoordinate(&array, N, Y, X, moveDirection, moveCount)
            }
        }
        
        score += array[Y][X]
        array[Y][X] = 0
        answer += "#\(x) \(score) \(X) \(Y)\n"
        x += 1
        
        score = 0
    }
    
    //MARK: - Output
    print(answer)
}
solution()
