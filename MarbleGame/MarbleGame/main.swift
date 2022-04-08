//
//  main.swift
//  MarbleGame
//
//  Created by 이영재 on 2022/04/08.
//MARK: - 구슬 게임

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var marbleGames: [Bool] = Array(repeating: false, count: n + 10)
    let baseCondition: Int = 3
    
    //MARK: - Process
    //1. 부분 문제를 정의한다.
    //n개의 구슬이 주어졌을 때, 1개, 2개, 3개씩 가져간다 했을 때, 철수가 이길 수 있는지 구해야 함.
    //T[i] = 철수가 이길 경우가 한개라도 있으면 true, 없으면 false
    
    //2. 점화식을 세운다.
    //각 게임은 철수부터 시작해서 공평하게 한번씩 진행되는 것과, 한 번에 1개 혹은 2개 혹은 3개를 가져갈 수 있다는 점에 유의해서
    //현재 시점에서 이전 결과에 의해 결정이 됨
    //T[i] = 1개 가져갔을 때 결과 && 2개 가져갔을 때 결과 && 3개 가져갔을 때 결과
    //즉, T[i] = T[i - 1] && T[i - 2] && T[i - 3] ? false : true(이전 결과는 영희의 차례 이므로 반대가 되어야 함)
    for i in 1...baseCondition {
        marbleGames[i] = true
    }
    
    for i in stride(from: baseCondition + 1, through: n, by: 1) {
        marbleGames[i] = marbleGames[i - 1] && marbleGames[i - 2] && marbleGames[i - 3] ? false : true
    }
    
    //MARK: - Output
    print(marbleGames[n] ? "YES" : "NO")
}
solution()
