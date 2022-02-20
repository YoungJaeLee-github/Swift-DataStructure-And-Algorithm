//
//  main.swift
//  BaseBallGame
//
//  Created by 이영재 on 2022/02/19.
//MARK: - baseball game

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct BaseBallGame {
    //MARK: - Properties
    var strikeCount: Int
    var ballCount: Int
    var candidateCount: Int
    
    //MARK: - Initializer
    init(_ strikeCount: Int, _ ballCount: Int, _ candidateCount: Int) {
        self.strikeCount = strikeCount
        self.ballCount = ballCount
        self.candidateCount = candidateCount
    }
}

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    let minNumber: Int = 1
    let maxNumber: Int = 9
    
    var baseBallGame: BaseBallGame = BaseBallGame(0, 0, 0)
    var answerInfo: [[Int]] = []
    
    for _ in 0..<N {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        answerInfo.append(input.map { Int($0) ?? 0 })
    }
    
    //MARK: - process
    for i in minNumber...maxNumber {
        for j in minNumber...maxNumber {
            for k in minNumber...maxNumber {
                if i != j && j != k && i != k {
                    var flag: Bool = false
                    
                    for data in answerInfo {
                        let numberI: Int = data[0] / 100
                        let numberJ: Int = (data[0] / 10) % 10
                        let numberK: Int = data[0] % 10
                        var strikeCount: Int = 0
                        var ballCount: Int = 0
                        
                        if i == numberI {
                            strikeCount += 1
                        }
                        
                        if j == numberJ {
                            strikeCount += 1
                        }
                        
                        if k == numberK {
                            strikeCount += 1
                        }
                        
                        if i == numberJ || i == numberK {
                            ballCount += 1
                        }
                        
                        if j == numberI || j == numberK {
                            ballCount += 1
                        }
                        
                        if k == numberI || k == numberJ {
                            ballCount += 1
                        }
                        
                        baseBallGame.strikeCount = strikeCount
                        baseBallGame.ballCount = ballCount
                        
                        if baseBallGame.strikeCount != data[1] || baseBallGame.ballCount != data[2] {
                            flag = true
                            break
                        }
                    }
                    
                    baseBallGame.candidateCount += flag ? 0 : 1
                }
            }
        }
    }
    
    //MARK: - output
    print(baseBallGame.candidateCount)
}
solution()
