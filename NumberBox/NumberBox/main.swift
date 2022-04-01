//
//  main.swift
//  NumberBox
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 숫자박스

//MARK: - Framework
import Foundation

//MARK: - Function
func binarySearch(_ array: [Int], _ start: Int, _ end: Int, _ value: Int) -> Bool {
    if start >= end {
        return array[start] == value ? true : false
    }
    
    let mid = (start + end) / 2
    if array[mid] == value {
        return true
    }
    
    return array[mid] < value ? binarySearch(array, mid + 1, end, value) : binarySearch(array, start, mid - 1, value)
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
    guard let _: Int = Int(readLine() ?? "0") else { return }
    guard let inputCandidates = readLine()?.components(separatedBy: " ") else { return }
    
    let array: [Int] = inputArray.map { Int($0) ?? 0 }.sorted { $0 < $1 }
    let candidates: [Int] = inputCandidates.map { Int($0) ?? 0 }
    var answer: String = ""
    
    //MARK: - Process
    for candidate in candidates {
        answer += binarySearch(array, 0, N - 1, candidate) ? "\(1)\n" : "\(0)\n"
    }
    
    //MARK: - Output
    print(answer)
    
}
solution()
