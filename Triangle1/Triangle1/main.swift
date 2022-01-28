//
//  main.swift
//  Triangle1
//
//  Created by 이영재 on 2022/01/27.
//MARK: - 삼각형 출력 1

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let n: Int = Int(input) ?? 0
    
    //MARK: - process
    for i in 1...n {
        for _ in 0..<i {
            print("*", terminator: "")
        }
        print()
    }
    
    //MARK: - output
}
solution()
