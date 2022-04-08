//
//  main.swift
//  GetPowSum
//
//  Created by 이영재 on 2022/04/08.
//MARK: - 제곱수의 합

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    
    let baseCondition: Int = 3
    var powSum: [Int] = Array(repeating: 0, count: N + 10)
    
    //MARK: - Process
    //1. 부분 문제를 정의한다.
    //T[i] = 제곱수의 합으로 i를 표현할 수 있는 최소 개수
    
    //2. 점화식을 세운다.
    //T[1] = 1^2 -> 1개
    //T[2] = 1^2 + 1^2 -> 2개
    //T[3] = 1^2 + 1^2 + 1^2 -> 3개
    //... 이런식으로 1의 제곱으로 다 채울수는 있지만 최소 개수는 아님
    //T[4] = 2^2 -> 1개
    //T[5] = 2^2 + 1^2 -> 2개, 여기서 자세히 보면, T[5 - 2^2] = T[1] + 1(2^2)개 임을 알 수 있음
    //따라서 T[i] = min(T[i](1^2 개수로 초기화) < T[i - 1^2 부터 자신보다 작은 제곱수] + 1)
    for i in 1...N {
        powSum[i] = i
    }
    
    for i in stride(from: baseCondition + 1, through: N, by: 1) {
        var j: Int = 1
        while j * j <= i {
            powSum[i] = powSum[i] < powSum[i - j * j] + 1 ? powSum[i] : powSum[i - j * j] + 1
            j += 1
        }
    }
    
    //MARK: - Output
    print(powSum[N])
}
solution()
