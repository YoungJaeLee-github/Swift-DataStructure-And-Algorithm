//
//  main.swift
//  LeapYear
//
//  Created by 이영재 on 2022/01/24.
//MARK: - 윤년

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    let N: Int = Int(input) ?? 0
    
    //MARK: - process & output
    if N % 4 == 0 && N % 100 != 0 {
        print("YES")
    } else if N % 400 == 0 {
        print("YES")
    } else {
        print("NO")
    }
}

solution()

