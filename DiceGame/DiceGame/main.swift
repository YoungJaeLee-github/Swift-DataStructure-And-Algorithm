//
//  main.swift
//  DiceGame
//
//  Created by 이영재 on 2022/01/28.
//MARK: - 주사위 게임

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func getSameCount(_ sameCount: inout Array<Array<Int>>, _ diceInfo: Array<Array<Int>>, _ n: Int, _ diceCount: Int) -> Void {
    for i in 0..<n {
        for j in 0..<diceCount {
            sameCount[i][diceInfo[i][j]] += 1
        }
    }
}

func getMaxSameCount(_ maxSameCount: inout Array<Int>, _ maxNumber: inout Array<Int>, _ sameCount: Array<Array<Int>>, _ n: Int, _ diceNum: Int) -> Void {
    for i in 0..<n {
        for j in 1...diceNum {
            if sameCount[i][j] == 0 {
                continue
            }
            
            if sameCount[i][j] >= 2 {
                maxSameCount[i] = 2
                for k in j...diceNum {
                    if maxSameCount[i] < sameCount[i][k] {
                        maxSameCount[i] = sameCount[i][k]
                        maxNumber[i] = k
                    }
                }
            } else {
                maxSameCount[i] = 1
                maxNumber[i] = j
            }
        }
    }
}

func getMaxMoney(_ money: Array<Int>) -> Int {
    var maxMoney: Int = 0
    for money in money {
        maxMoney = maxMoney < money ? money : maxMoney
    }
    
    return maxMoney
}

func getMoney(_ money: inout Array<Int>, _ maxSameCount: Array<Int>, _ maxNumber: Array<Int>, _ n: Int) -> Void {
    for i in 0..<n {
        switch maxSameCount[i] {
            case 3:
                money[i] = 10000 + maxNumber[i] * 1000
            case 2:
                money[i] = 1000 + maxNumber[i] * 100
            default:
                money[i] = maxNumber[i] * 100
        }
    }
}

func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let N: Int = Int(input) ?? 0
    let diceCount: Int = 3
    let diceNum: Int = 6
    var maxMoney: Int = 0
    var diceInfo: Array<Array<Int>> = []
    var sameCount: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: diceNum + 1), count: N)
    var maxSameCount: Array<Int> = Array(repeating: 0, count: N)
    var maxNumber: Array<Int> = Array(repeating: 0, count: N)
    var money: Array<Int> = Array(repeating: 0, count: N)
    
    for _ in 0..<N {
        guard let inputDice = readLine()?.components(separatedBy: " ") else { return }
        diceInfo.append(inputDice.map { Int($0) ?? 0})
    }
    
    //MARK: - process
    getSameCount(&sameCount, diceInfo, N, diceCount)
    getMaxSameCount(&maxSameCount, &maxNumber, sameCount, N, diceNum)
    getMoney(&money, maxSameCount, maxNumber, N)
    maxMoney = getMaxMoney(money)
    
    //MARK: - output
    print(maxMoney)
}
solution()
