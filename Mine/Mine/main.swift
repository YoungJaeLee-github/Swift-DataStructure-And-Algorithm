//
//  main.swift
//  Mine
//
//  Created by 이영재 on 2022/01/28.
//MARK: - mine

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct Mine {
    //MARK: - Properties
    var N: Int
    var M: Int
    var X: Int
    var Y: Int
    var gameMap: Array<Array<Int>>
    
    //MARK: - Initializer
    init(_ N: Int, _ M: Int, _ X: Int, _ Y: Int, _ gameMap: Array<Array<Int>>) {
        self.N = N
        self.M = M
        self.X = X
        self.Y = Y
        self.gameMap = gameMap
    }
}

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let inputMapInfo = readLine()?.components(separatedBy: " ") else { return }
    guard let inputPlayerInfo = readLine()?.components(separatedBy: " ") else { return }
    
    let N: Int = inputMapInfo.map { Int($0) }[0] ?? 0
    let M: Int = inputMapInfo.map { Int($0) }[1] ?? 0
    let X: Int = inputPlayerInfo.map { Int($0) }[0] ?? 0
    let Y: Int = inputPlayerInfo.map { Int($0) }[1] ?? 0
    
    var gameMap: Array<Array<Int>> = []
    var answer: String = ""
    var mineCount: Int = 0
    
    for _ in 0..<N {
        guard let inputGameMapInfo = readLine()?.components(separatedBy: " ") else { return }
        
        let gameMapInfo: Array<Int> = inputGameMapInfo.map { Int($0) ?? 0}
        gameMap.append(gameMapInfo)
    }
    
    let mine: Mine = Mine(N, M, X - 1, Y - 1, gameMap)
    
    //MARK: - process
    if mine.gameMap[mine.X][mine.Y] == 1 {
        answer = "game over"
    } else {
        mineCount += mine.gameMap[mine.X - 1][mine.Y] == 1 ? 1 : 0
        mineCount += mine.gameMap[mine.X + 1][mine.Y] == 1 ? 1 : 0
        mineCount += mine.gameMap[mine.X][mine.Y - 1] == 1 ? 1 : 0
        mineCount += mine.gameMap[mine.X][mine.Y + 1] == 1 ? 1 : 0
        mineCount += mine.gameMap[mine.X - 1][mine.Y - 1] == 1 ? 1 : 0
        mineCount += mine.gameMap[mine.X - 1][mine.Y + 1] == 1 ? 1 : 0
        mineCount += mine.gameMap[mine.X + 1][mine.Y - 1] == 1 ? 1 : 0
        mineCount += mine.gameMap[mine.X + 1][mine.Y + 1] == 1 ? 1 : 0
        
        answer = "\(mineCount)"
    }
    
    //MARK: - output
    print(answer)
}
solution()
