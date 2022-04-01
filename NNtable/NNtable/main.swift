//
//  main.swift
//  NNtable
//
//  Created by 이영재 on 2022/04/01.
//MARK: - NN단표

//MARK: - Framework
import Foundation

//MARK: - Function
func getOrder(_ N: Int, _ number: Int64) -> Int64 {
    var result: Int64 = 0
    for i in 1...N {
        if i * N < number {
            result += Int64(N)
        } else {
            result += number % Int64(i) == 0 ? number / Int64(i) - 1 : number / Int64(i)
        }
    }
    result += 1
    
    return result
}

func binarySearch(_ N: Int, _ start: Int64, _ end: Int64, _ K: Int64) -> Int64 {
    if start + 1 >= end {
        return start
    }
    
    let mid: Int64 = (start + end) / 2
    return getOrder(N, mid) <= K ? binarySearch(N, mid, end, K) : binarySearch(N, start, mid, K)
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let K: Int64 = Int64(readLine() ?? "0") else { return }
    
    //MARK: - Process
    let result: Int64 = binarySearch(N, 1, Int64(N * N + 1), K)
    
    //MARK: - Output
    print(result)
    
}
solution()

