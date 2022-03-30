//
//  main.swift
//  QuickSort
//
//  Created by 이영재 on 2022/03/30.
//MARK: - 퀵정렬 구현하기

//MARK: - Framework
import Foundation

//MARK: - Function
func getLeft(_ array: [Int], _ start: Int, _ end: Int, _ pivot: Int, _ left: inout [Int]) -> Int {
    var index: Int = 0
    for i in start...end {
        if array[i] <= pivot {
            left[index] = array[i]
            index += 1
        }
    }
    
    return index
}

func getRight(_ array: [Int], _ start: Int, _ end: Int, _ pivot: Int, _ right: inout [Int]) -> Int {
    var index: Int = 0
    for i in start...end {
        if array[i] > pivot {
            right[index] = array[i]
            index += 1
        }
    }
    
    return index
}

func quickSort(_ array: inout [Int], _ left: inout [Int], _ right: inout [Int], _ start: Int, _ end: Int) {
    //array의 start 번 째 값 부터 end 번 째 값 까지 퀵 정렬 하는 함수
    if start >= end {
        return
    }
    
    let pivot: Int = array[start]
    let leftCount: Int = getLeft(array, start + 1, end, pivot, &left)
    let rightCount: Int = getRight(array, start + 1, end, pivot, &right)
    
    for i in 0..<leftCount {
        array[start + i] = left[i]
    }
    
    array[start + leftCount] = pivot
    
    for i in 0..<rightCount {
        array[start + leftCount + 1 + i] = right[i]
    }
    
    quickSort(&array, &left, &right, start, start + leftCount - 1)
    quickSort(&array, &left, &right, start + leftCount + 1, end)
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    var answer: String = ""
    var array: [Int] = input.map { Int($0) ?? 0 }
    var left: [Int] = Array(repeating: 0, count: N)
    var right: [Int] = Array(repeating: 0, count: N)
    
    //MARK: - Process
    quickSort(&array, &left, &right, 0, N - 1)
    
    for i in 0..<array.count - 1 {
        answer += "\(array[i]) "
    }
    answer += "\(array[array.count - 1])"
    
    //MARK: - Output
    print(answer)
}
solution()
