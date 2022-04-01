//
//  main.swift
//  BinarySearch
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 이진탐색

//MARK: - Framework
import Foundation

//MARK: - Function
func binarySearch(_ array: [Int], _ start: Int, _ end: Int, _ value: Int) -> Bool {
    if start >= end {
        return array[start] == value ? true : false
    }
    
    let mid: Int = (start + end) / 2
    if array[mid] == value {
        return true
    }
    
    return array[mid] < value ? binarySearch(array, mid + 1, end, value) : binarySearch(array, start, mid - 1, value)
}

func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
    guard let inputQuestions = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = input.map{ Int($0) }[0] ?? 0
    let _: Int = input.map { Int($0) }[1] ?? 0
    let array: [Int] = inputArray.map { Int($0) ?? 0 }
    let questions: [Int] = inputQuestions.map { Int($0) ?? 0 }
    var answer: String = ""
    
    //MARK: - Process
    for question in questions {
        answer += binarySearch(array, 0, n - 1, question) ? "YES\n" : "NO\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
