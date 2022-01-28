//
//  main.swift
//  PrimeNumber2
//
//  Created by 이영재 on 2022/01/27.
//MARK: - 소수 판별 2

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func isPrime(_ number: Int) -> Bool {
    if number == 1 {
        return false
    } else if number == 2 {
        return true
    } else {
        var flag: Bool = true
        var i: Int = 2
        while i * i <= number {
            if number % i == 0 {
                flag = false
                break
            }
            i += 1
        }
        
        return flag
    }
}

func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var answer: String = ""
    
    //MARK: - process
    for i in n..<m {
        answer += isPrime(i) ? "\(i) " : ""
    }
    answer += isPrime(m) ? "\(m)" : ""
    
    //MARK: - output
    print(answer)
}
solution()

