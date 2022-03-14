//
//  main.swift
//  Factorial
//
//  Created by 이영재 on 2022/03/14.
//MARK: - 팩토리얼

//MARK: - Framework
import Foundation

//MARK: - Function
func getFactorial(_ N: Int) -> Int {
    return N == 0 ? 1 : N * getFactorial(N - 1)
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var factorial: Int = 0
    
    //MARK: - Process
    factorial = getFactorial(N)
    
    //MARK: - Output
    print(factorial)
}
solution()
