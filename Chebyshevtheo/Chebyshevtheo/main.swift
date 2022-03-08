//
//  main.swift
//  Chebyshevtheo
//
//  Created by 이영재 on 2022/03/08.
//MARK: - chebyshevtheo

//MARK: - Framework
import Foundation

//MARK: - Function
func getPrimeNumberCount(_ number: Int) -> Int {
    var primeNumbers: [Bool] = Array(repeating: true, count: 2 * number + 10)
    var primeNumberCount: Int = 0
    
    primeNumbers[1] = false
    for i in 2...(2 * number) {
        var j: Int = 2
        while i * j <= 2 * number {
            primeNumbers[i * j] = false
            j += 1
        }
    }
    
    for i in number + 1...2 * number {
        primeNumberCount += primeNumbers[i] ? 1 : 0
    }
    
    return primeNumberCount
}

func solution() -> Void {
    var answer: String = ""
    while true {
        //MARK: - Input
        guard let n: Int = Int(readLine() ?? "0") else { return }
        
        //MARK: - Process
        if n == 0 {
            break
        }
        
        answer += "\(getPrimeNumberCount(n))\n"
    }
    
    //MARK: - Output
    print(answer, terminator: "")
}
solution()
