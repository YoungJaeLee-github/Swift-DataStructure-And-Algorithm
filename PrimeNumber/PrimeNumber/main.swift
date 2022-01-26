//
//  main.swift
//  PrimeNumber
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 소수 판별

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func isPrimeNumber(_ n: Int) -> Bool {
    if n == 1 {
        return false
    } else if n == 2 {
        return true
    } else {
        var flag: Bool = true
        for i in 2..<n {
            if n % i == 0 {
                flag = false
                break
            }
        }
        
        return flag
    }
}

func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    
    let n: Int = Int(input) ?? 0
    var answer: String = ""
    
    //MARK: - process
    answer = isPrimeNumber(n) ? "YES" : "NO"
    
    //MARK: - output
    print(answer)
}
solution()
