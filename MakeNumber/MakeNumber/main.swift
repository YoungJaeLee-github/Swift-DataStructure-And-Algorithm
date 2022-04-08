//
//  main.swift
//  MakeNumber
//
//  Created by 이영재 on 2022/04/08.
//MARK: - 숫자 만들기

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    let baseCondition: Int = 3
    var sum: Int = 0
    var table: [Int] = Array(repeating: 0, count: N + 10)
    
    //MARK: - Process
    //1. 부분 문제를 정의
    //T[i] = 1, 2, 3을 사용하여 i을 만드는 총 경우의 수
    //같은 숫자를 중복하여 사용할 수 있음
    
    //2. 점화식을 세운다.
    //T[0] = 불가능
    //T[1] = 1, T[2] = T[1] + 1, T[3] = T[2] + T[1] + 1 -> Base Condition
    //T[4] = T[3] + T[2] + T[1]
    //T[i] = T[i - 3] + T[i - 2] + T[i - 1]
    table[1] = 1
    for i in 2...baseCondition {
        sum += table[i - 1]
        table[i] = sum + 1
    }
    
    for i in stride(from: baseCondition + 1, through: N, by: 1) {
        table[i] = (table[i - 3] + table[i - 2] + table[i - 1]) % 1000007
    }
    
    //MARK: - Output
    print(table[N])
}
solution()
