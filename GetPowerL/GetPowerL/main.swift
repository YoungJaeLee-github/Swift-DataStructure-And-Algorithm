//
//  main.swift
//  GetPowerL
//
//  Created by 이영재 on 2022/04/07.
//MARK: - 거듭 제곱 구하기 L

//MARK: - Framework
import Foundation

//MARK: Function
func getPowerL(_ n: Int, _ m: Int64) -> Int64 {
    if m == 0 {
        return 1
    }
    
    if m % 2 == 0 {
        let result: Int64 = getPowerL(n, m / 2) % 10007
        return result * result % 10007
    } else {
        return Int64(n) * getPowerL(n, m - 1) % 10007
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int64 = input.map { Int64($0) }[1] ?? 0
    var result: Int64 = 0
    
    //MARK: - Process
    result = getPowerL(n, m)
    
    //MARK: - Output
    print(result)
}
solution()
