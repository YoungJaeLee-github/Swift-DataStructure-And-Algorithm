//
//  main.swift
//  AttackRange
//
//  Created by 이영재 on 2022/01/28.
//MARK: - attackrange

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct DefenceGame {
    //MARK: - Properties
    var gameMap: Array<Array<Int>>
    var N: Int
    var X: Int
    var Y: Int
    var R: Int
    
    //MARK: - Initializer
    init(_ N: Int, _ X: Int, _ Y: Int, _ R: Int) {
        self.gameMap = Array(repeating: Array(repeating: 0, count: N + 10), count: N + 10)
        self.N = N
        self.X = X
        self.Y = Y
        self.R = R
    }
}

//MARK: - Functions
func getAbsolute(_ number: Int) -> Int {
    return number < 0 ? -number : number
}

func solution() -> Void {
    //MARK: - input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let X: Int = input.map { Int($0) }[0] ?? 0
    let Y: Int = input.map { Int($0) }[1] ?? 0
    let R: Int = input.map { Int($0) }[2] ?? 0
    var defenceGame: DefenceGame = DefenceGame(N, X, Y, R)
    var answer: String = ""
    
    //MARK: - process
    for i in 1...N {
        for j in 1...N {
            if i == defenceGame.X && j == defenceGame.Y {
                answer += "* "
                continue
            }
            
            let position: Int = getAbsolute(defenceGame.X - i) + getAbsolute(defenceGame.Y - j)
            if position <= defenceGame.R {
                answer += "\(position) "
                defenceGame.gameMap[i][j] = position
            } else {
                answer += "\(0) "
            }
        }
        answer += "\n"
    }
    
    //MARK: - output
    print(answer)
}
solution()

