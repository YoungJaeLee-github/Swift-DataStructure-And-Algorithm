//
//  main.swift
//  NumberCount
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 숫자 개수 세기

//MARK: - Framework
import Foundation

//MARK: - Function
func maxBinarySearch(_ array: [Int], _ start: Int, _ end: Int, _ value: Int) -> Int {
    if start + 1 >= end {
        return start
    }
    
    let mid: Int = (start + end) / 2
    return array[mid] <= value ? maxBinarySearch(array, mid, end, value) : maxBinarySearch(array, start, mid, value)
}

func minBinarySearch(_ array: [Int], _ start: Int, _ end: Int, _ value: Int) -> Int {
    if start + 1 >= end {
        return end
    }
    
    let mid: Int = (start + end) / 2
    return array[mid] >= value ? minBinarySearch(array, start, mid, value) : minBinarySearch(array, mid, end, value)
}

func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
    guard let inputQuestions = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = input.map { Int($0) }[0] ?? 0
    let _: Int = input.map { Int($0) }[1] ?? 0
    let array: [Int] = inputArray.map { Int($0) ?? 0}.sorted { $0 < $1 }
    let questions: [Int] = inputQuestions.map { Int($0) ?? 0 }
    var answer: String = ""
    
    //MARK: - Process
    for question in questions {
        let maxIndex: Int = maxBinarySearch(array, 0, n, question)
        let minIndex: Int = minBinarySearch(array, -1, n - 1, question)
        
        answer += "\(maxIndex - minIndex + 1)\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
