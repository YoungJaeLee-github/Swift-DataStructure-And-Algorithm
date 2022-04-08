//
//  main.swift
//  GetMaxButton
//
//  Created by 이영재 on 2022/04/08.
//MARK: - 버튼 누르기

//MARK: - Framework
import Foundation

//MARK: - Function
func getMax(_ array: [[Int]], _ baseCondition: Int, _ N: Int) -> Int {
    var result: Int = 0
    
    for i in 0..<baseCondition {
        result = result < array[N - 1][i] ? array[N - 1][i] : result
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    let baseCondition: Int = 3
    var result: Int = 0
    var buttonValues: [[Int]] = []
    
    for _ in 0..<N {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        buttonValues.append(inputData.map { Int($0) ?? 0 })
    }
    
    //MARK: - Process
    //1. 부분 문제를 정의한다.
    //max(T[N - 1][0], T[N - 1][1], T[N - 1][2) = 각 초마다 이전 시점에서 선택한 버튼을 제외한 버튼을 선택했을 때 누적합의 최대값
    
    //2. 점화식을 세운다.
    //T[i][0] += T[i - 1][1] < T[i - 1][2] ? T[i - 1][2] : T[i - 1][1]
    //T[i][1] += T[i - 1][0] < T[i - 1][2] ? T[i - 1][2] : T[i - 1][0]
    //T[i][2] += T[i - 1][0] < T[i - 1][1] ? T[i - 1][1] : T[i - 1][0]
    //...T[N - 1][0], T[N - 1][1], T[N - 1][2] 까지
    //max(T[N - 1][0], T[N - 1][1], T[N - 1][2)
    for i in stride(from: 1, to: N, by: 1) {
        buttonValues[i][0] += buttonValues[i - 1][1] < buttonValues[i - 1][2] ? buttonValues[i - 1][2] : buttonValues[i - 1][1]
        buttonValues[i][1] += buttonValues[i - 1][0] < buttonValues[i - 1][2] ? buttonValues[i - 1][2] : buttonValues[i - 1][0]
        buttonValues[i][2] += buttonValues[i - 1][1] < buttonValues[i - 1][0] ? buttonValues[i - 1][0] : buttonValues[i - 1][1]
    }
    
    result = getMax(buttonValues, baseCondition, N)
    
    //MARK: - Output
    print(result)
}
solution()
