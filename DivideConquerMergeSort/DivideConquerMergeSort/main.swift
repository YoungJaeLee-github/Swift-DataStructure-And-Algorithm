//
//  main.swift
//  DivideConquerMergeSort
//
//  Created by 이영재 on 2022/04/07.
//MARK: - 합병 정렬 연습(분할 정복)

//MARK: - Framework
import Foundation

//MARK: - Function
func merging(_ array: inout [Int], _ temp: inout [Int], _ s1: Int, _ e1: Int, _ s2: Int, _ e2: Int) -> Void {
    var p, q, index: Int
    p = s1
    q = s2
    index = 0
    
    while p <= e1 && q <= e2 {
        if array[p] < array[q] {
            temp[index] = array[p]
            index += 1
            p += 1
        } else {
            temp[index] = array[q]
            index += 1
            q += 1
        }
    }
    
    if p > e1 {
        for i in q...e2 {
            temp[index] = array[i]
            index += 1
        }
    } else {
        for i in p...e1 {
            temp[index] = array[i]
            index += 1
        }
    }
    
    for i in s1...e2 {
        array[i] = temp[i - s1]
    }
}

func mergeSort(_ array: inout [Int], _ temp: inout [Int], _ start: Int, _ end: Int) -> Void {
    if start >= end {
        return
    }
    
    let mid: Int = (start + end) / 2
    mergeSort(&array, &temp, start, mid)
    mergeSort(&array, &temp, mid + 1, end)
    
    merging(&array, &temp, start, mid, mid + 1, end)
}

func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    var array: [Int] = inputArray.map { Int($0) ?? 0 }
    var temp: [Int] = Array(repeating: 0, count: n + 10)
    var answer: String = ""
    
    //MARK: - Process
    mergeSort(&array, &temp, 0, n - 1)
    
    for i in 0..<n - 1 {
        answer += "\(array[i]) "
    }
    answer += "\(array[n - 1])"
    
    //MARK: - Output
    print(answer)
}
solution()
