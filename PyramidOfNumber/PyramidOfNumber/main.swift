//
//  main.swift
//  PyramidOfNumber
//
//  Created by 이영재 on 2022/01/28.
//MARK: - 숫자 피라미드

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    var S: Int = input.map { Int($0) }[1] ?? 0
    
    //MARK: - process
    for i in 1...N {
        for _ in i..<N {
            print(" ", terminator: "")
        }
        
        if i % 2 == 0 {
            for _ in 0..<2 * i - 1 {
                if S == 10 {
                    S = 1
                }
                print(S, terminator: "")
                S += 1
            }
        } else {
            var reverse: Array<Int> = []
            for _ in 0..<2 * i - 1 {
                if S == 10 {
                    S = 1
                }
                reverse.append(S)
                S += 1
            }
            
            for j in stride(from: reverse.count - 1, through: 0, by: -1) {
                print(reverse[j], terminator: "")
            }
        }
        print()
    }
    
    //MARK: - output
}
solution()

