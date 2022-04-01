//
//  main.swift
//  UnionInterval
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 구간의 합집합

//MARK: - Framework
import Foundation

//MARK: - Function
func getMax(_ array: [[Int]], _ n: Int) -> Int {
    var result: Int = array[0][1]
    for i in 1..<n {
        result = array[i][1] > result ? array[i][1] : result
    }
        
    return result
}

func getMin(_ array: [[Int]], _ n: Int) -> Int {
    var result: Int = array[0][0]
    for i in 1..<n {
        result = array[i][0] < result ? array[i][0] : result
    }
    
    return result
}

func getOrder(_ array: [[Int]], _ n: Int, _ number: Int) -> Int64 {
    var result: Int64 = 0
    for i in 0..<n {
        if number > array[i][1] {
            result += Int64(array[i][1] - array[i][0] + 1)
        } else {
            result += number <= array[i][0] ? 0 : Int64(number - array[i][0])
        }
    }
    
    return result
}

func binarySearch(_ array: [[Int]], _ n: Int, _ start: Int, _ end: Int, _ value: Int64) -> Int {
    if start + 1 >= end {
        return start
    }
    
    let mid: Int = (start + end) / 2
    return getOrder(array, n, mid) <= value ? binarySearch(array, n, mid, end, value) : binarySearch(array, n, start, mid, value)
}

func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    
    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n)
    for i in 0..<n {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        let s: Int = input.map { Int($0) }[0] ?? 0
        let e: Int = input.map {Int($0) }[1] ?? 0
        
        array[i][0] = s
        array[i][1] = e
    }
    
    guard let i: Int64 = Int64(readLine() ?? "0") else { return }
    let start: Int = getMin(array, n)
    let end: Int = getMax(array, n)
    
    //MARK: - Process
    let result: Int = binarySearch(array, n, start, end + 1, i)
    
    //MARK: - Output
    print(result)
    
}
solution()
