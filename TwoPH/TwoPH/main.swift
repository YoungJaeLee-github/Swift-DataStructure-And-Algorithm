//
//  main.swift
//  TwoPH
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 두 용액

//MARK: - Framework
import Foundation

//MARK: - Function
func getAbs(_ number: Int64) -> Int64 {
    return number < 0 ? number * -1 : number
}

func binarySearch(_ array: [Int], _ start: Int, _ end: Int, _ value: Int) -> Int {
    if start + 1 >= end {
        return getAbs(Int64(array[start] - value)) < getAbs(Int64(array[end] - value)) ? array[start] : array[end]
    }
    
    let mid: Int = (start + end) / 2
    return array[mid] < value ? binarySearch(array, mid, end, value) : binarySearch(array, start, mid, value)
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let array: [Int] = inputArray.map { Int($0) ?? 0 }.sorted { $0 < $1 }
    var A: [Int] = []
    var B: [Int] = []
    var min: Int64 = 0
    var minIndex: Int = 0
    
    //MARK: - Process
    for i in 0..<N - 1 {
        A.append(array[i])
    }
    
    for i in 0..<N - 1 {
        B.append(binarySearch(array, i + 1, N - 1, A[i] * -1))
    }
    
    min = getAbs(Int64(A[0] + B[0]))
    for i in 1..<N - 1 {
        if min > getAbs(Int64(A[i] + B[i])) {
            min = getAbs(Int64(A[i] + B[i]))
            minIndex = i
        }
    }
    
    //MARK: - Output
    print(A[minIndex] < B[minIndex] ? "\(A[minIndex]) \(B[minIndex])" : "\(B[minIndex]) \(A[minIndex])")
}
solution()
