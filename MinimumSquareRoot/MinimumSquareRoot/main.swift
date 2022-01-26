//
//  main.swift
//  MinimumSquareRoot
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 제곱근 구하기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let N: Int = Int(input) ?? 0
    var minimumSquareRoot: Int = 0
    
    //MARK: - process
    for i in 1..<N {
        if i * i >= N {
            minimumSquareRoot = i
            break
        }
    }
    
    //MARK: - output
    print(minimumSquareRoot)
}
solution()

