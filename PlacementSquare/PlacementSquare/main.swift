//
//  main.swift
//  PlacementSquare
//
//  Created by 이영재 on 2022/04/08.
//MARK: - 직사각형배치의경우의수

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    
    let baseCondition: Int = 2
    var T: [Int] = Array(repeating: 0, count: N + 10)
    
    //MARK: - Process
    //1. 부분 문제를 정의한다.
    //T[i] = 2 x 1 모양의 타일로 2 x i 크기의 타일을 채울 수 있는 모든 경우의 수
    
    //2. 점화식을 세운다.
    //T[i] = T[i - 1] + T[i - 2] -> 피보나치 수열
    for i in 1...baseCondition {
        T[i] = i
    }
    
    for i in stride(from: baseCondition + 1, through: N, by: 1) {
        T[i] = (T[i - 1] + T[i - 2]) % 1000007
    }
    
    //MARK: - Output
    print(T[N])
}
solution()
