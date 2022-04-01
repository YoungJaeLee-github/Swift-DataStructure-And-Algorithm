//
//  main.swift
//  NotDuplicateInterval
//
//  Created by 이영재 on 2022/04/01.
//MARK: - 중복 없는 구간

//MARK: - Framework
import Foundation

//MARK: - Function
func isPossibleInterval(_ array: [Int], _ n: Int, _ r: Int) -> Bool {
    //해당 구간이 중복 없는 구간인지 검사하는 함수
    var isPossible: Bool = true
    if r == 1 {
        isPossible = true
    } else {
        var counts: [Int] = Array(repeating: 0, count: array.count + 1)
        var duplicateCount: Int = 0
        
        for i in 0..<r {
            counts[array[i]] += 1
            duplicateCount += counts[array[i]] == 2 ? 1 : 0
        }
        isPossible = duplicateCount == 0 ? true : false
        
        if !isPossible {
            for i in 1...n - r {
                duplicateCount -= counts[array[i - 1]] == 2 ? 1 : 0
                counts[array[i - 1]] -= 1
                
                duplicateCount += counts[array[r + i - 1]] == 1 ? 1 : 0
                counts[array[r + i - 1]] += 1
                
                if duplicateCount == 0 {
                    isPossible = true
                    break
                }
            }
        }
    }
    
    return isPossible
}

func binarySearch(_ array: [Int], _ n: Int, _ start: Int, _ end: Int) -> Int {
    if start + 1 >= end {
        return start
    }
    
    let mid: Int = (start + end) / 2
    return isPossibleInterval(array, n, mid) ? binarySearch(array, n, mid, end) : binarySearch(array, n, start, mid)
}

func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
    let array: [Int] = inputArray.map { Int($0) ?? 0 }
    
    //MARK: - Process
    let result: Int = binarySearch(array, n, 1, n + 1)
    
    //MARK: - Output
    print(result)
}
solution()
