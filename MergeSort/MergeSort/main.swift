//
//  main.swift
//  MergeSort
//
//  Created by 이영재 on 2022/03/30.
//MARK: - 합병정렬 구현하기

//MARK: - Framework
import Foundation

//MARK: - Variable
var tempArray: [Int] = []

//MARK: - Function
func merging(_ array: inout [Int], _ s1: Int, _ e1: Int, _ s2: Int, _ e2: Int) -> Void {
    var p: Int = s1
    var q: Int = s2
    var index: Int = 0

    while p <= e1 && q <= e2 {
        if array[p] <= array[q] {
            tempArray[index] = array[p]
            p += 1
        } else {
            tempArray[index] = array[q]
            q += 1
        }
        index += 1
    }

    if p > e1 {
        for i in q...e2 {
            tempArray[index] = array[i]
            index += 1
        }
    } else {
        for i in p...e1 {
            tempArray[index] = array[i]
            index += 1
        }
    }

    for i in s1...e2 {
        array[i] = tempArray[i - s1]
    }
}

func mergeSort(_ array: inout [Int], _ start: Int, _ end: Int) -> Void {
    //array의 start 번 째 값 부터 end 번 째 값 까지 합병정렬 하는 함수
    if start >= end {
        return
    }

    let mid: Int = (start + end) / 2
    mergeSort(&array, start, mid)
    mergeSort(&array, mid + 1, end)

    merging(&array, start, mid, mid + 1, end)
}

func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    var answer: String = ""
    var array: [Int] = input.map { Int($0) ?? 0 }
    tempArray = Array(repeating: 0, count: n)

    //MARK: - Process
    mergeSort(&array, 0, n - 1)

    for i in 0..<array.count - 1 {
        answer += "\(array[i]) "
    }
    answer += "\(array[array.count - 1])"

    //MARK: - Output
    print(answer)
}
solution()
