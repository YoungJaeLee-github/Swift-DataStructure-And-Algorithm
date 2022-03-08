//
//  main.swift
//  FindPrime
//
//  Created by 이영재 on 2022/03/08.
//MARK: - findprime

//MARK: - Framework
import Foundation

//MARK: - Function
func isPrimeNumber(_ number: Int) -> Bool {
    var isPrimeNumber: Bool = true
    
    if number == 1 {
        isPrimeNumber = false
    } else {
        var primeNumber: Int = 2
        while primeNumber * primeNumber <= number {
            if number % primeNumber == 0 {
                isPrimeNumber = false
                break
            }
            
            primeNumber += 1
        }
    }
    
    return isPrimeNumber
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var primeNumberCount: Int = 0
            
    //MARK: - Process
    for _ in 0..<N {
        guard let number: Int = Int(readLine() ?? "0") else { return }
        primeNumberCount += isPrimeNumber(number) ? 1 : 0
    }
    
    //MARK: - Output
    print(primeNumberCount)
}
solution()
