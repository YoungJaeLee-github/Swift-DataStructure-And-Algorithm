//
//  main.swift
//  CutTree
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 나무 자르기

//MARK: - Framework
import Foundation

//MARK: - Function
func getTree(_ array: [Int], _ H: Int) -> Int64 {
    var result: Int64 = 0
    for data in array {
        result += data > H ? Int64(data - H) : 0
    }
    
    return result
}

func binarySearch(_ array: [Int], _ start: Int, _ end: Int, _ value: Int64) -> Int {
    //start부터 end까지의 절단기 높이 후보로 array의 나무들을 잘랐을 때,
    //얻어지는 나무 높이의 합과 가져가고자 하는 나무 높이를 비교하여,
    //이진탐색을 통해 절단기의 최대 높이 값을 반환하는 함수
    if start + 1 >= end {
        return start
    }
    
    let mid: Int = (start + end) / 2
    return getTree(array, mid) >= value ? binarySearch(array, mid, end, value) : binarySearch(array, start, mid, value)
}

func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    guard let inputArray = readLine()?.components(separatedBy: " ") else { return }
    
    let _: Int = input.map { Int($0) }[0] ?? 0
    let M: Int64 = input.map { Int64($0) }[1] ?? 0
    let array: [Int] = inputArray.map { Int($0) ?? 0 }
    let maxHeight: Int = 1000000000
    
    //MARK: - Process
    let result: Int = binarySearch(array, 1, maxHeight, M)
    
    //MARK: - Output
    print(result)
}
solution()
