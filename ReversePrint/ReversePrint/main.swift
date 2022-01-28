//
//  main.swift
//  ReversePrint
//
//  Created by 이영재 on 2022/01/27.
//MARK: - 역으로 출력하기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let _ = readLine() else { return }
    guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
    
    //MARK: - process
    for i in stride(from: inputArray.count - 1, to: 0, by: -1) {
        print("\(inputArray[i]) ", terminator: "")
    }
    print(inputArray[0])
    
    //MARK: - output
}
solution()

