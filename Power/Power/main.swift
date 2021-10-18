//
//  main.swift
//  Power
//
//  Created by 이영재 on 2021/10/18.
//MARK: - 거듭제곱 구하기 L
import Foundation

//MARK: - function
func power(_ n: Int64, _ m: Int64) -> Int64 {
    if m == 0 {
        return 1
    } else {
        if (m % 2 == 0) {
            let temp: Int64 = power(n, m / 2)
            return (temp * temp) % 10007
        } else {
            return (power(n, m - 1) * n) % 10007
        }
    }
}

//MARK: - input
let input = readLine()!.components(separatedBy: " ").map { Int64($0)! }
let n: Int64 = input[0]   // 1 <= n <= 100
let m: Int64 = input[1]  // 1 <= m < 1000000000000000000

//MARK: - process
let answer: Int64 = power(n, m)

//MARK: - output
print(answer)

