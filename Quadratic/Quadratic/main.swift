//
//  main.swift
//  Quadratic
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 2차식 정답 추측

//MARK: - Framework
import Foundation

//MARK: - Function
func binarySearch(_ start: Int64, _ end: Int64, _ value: Int64) -> Int64 {
    if start + 1 >= end {
        return start
    }
    
    let x: Int64 = (start + end) / 2
    return x * (x + 1) <= value ? binarySearch(x, end, value) : binarySearch(start, x, value)
}

func solution() -> Void {
    //MARK: - Input
    guard let a: Int64 = Int64(readLine() ?? "0") else { return }
    
    //MARK: - Process
    let result: Int64 = binarySearch(0, Int64(sqrt(Double(a))) + 1, a)
    
    //MARK: - Output
    print(result)
}
solution()
