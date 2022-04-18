//
//  main.swift
//  AdvancedPrimeNumber
//
//  Created by 이영재 on 2022/04/18.
//MARK: - adv. 소수 판별

//MARK: - Framework
import Foundation

//MARK: - Function
func isPrime(_ number: Int) -> Bool {
    var result: Bool = true
    if number == 1 {
        result = false
    } else if number == 2 || number == 3 {
        result = true
    } else {
        var start: Int = 2
        while start * start <= number {
            if number % start == 0 {
                result = false
                break
            }
            
            start += 1
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var result: Bool = false
    
    //MARK: - Process
    result = isPrime(N)
    
    //MARK: - Output
    print(result ? "YES" : "NO")
}
solution()
