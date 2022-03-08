//
//  main.swift
//  Pfactorization
//
//  Created by 이영재 on 2022/03/08.
//MARK: - pfactorization

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var number: Int = N
    var primeNumber: Int = 2
    var answer: String = ""
    
    //MARK: - Process
    while number > 1 {
        while number % primeNumber == 0 {
            answer += "\(primeNumber)\n"
            number /= primeNumber
        }
        primeNumber += 1
    }
    
    //MARK: - Output
    print(answer, terminator: "")
}
solution()
