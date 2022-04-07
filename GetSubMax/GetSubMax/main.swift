//
//  main.swift
//  GetSubMax
//
//  Created by 이영재 on 2022/04/07.
//MARK: - 연속 부분 최대합

//MARK: - Framework
import Foundation

//MARK: - Function
func getSubMax(_ array: [Int], _ start: Int, _ end: Int) -> Int {
    //array의 start 부터 end 까지의 연속 부분 최대합을 반환하는 함수
    if start >= end {
        return array[start]
    }
    
    let mid: Int = (start + end) / 2
    let leftSubMax: Int = getSubMax(array, start, mid)
    let rightSubMax: Int = getSubMax(array, mid + 1, end)
    
    var leftSum, leftMax, rightSum, rightMax, middleSubMax: Int
    leftSum = 0
    leftMax = -987987987
    rightSum = 0
    rightMax = -987987987
    
    for i in stride(from: mid, through: start, by: -1) {
        leftSum += array[i]
        
        leftMax = leftMax < leftSum ? leftSum : leftMax
    }
    
    for i in mid + 1...end {
        rightSum += array[i]
        
        rightMax = rightMax < rightSum ? rightSum : rightMax
    }

    middleSubMax = leftMax + rightMax
    
    if leftSubMax > rightSubMax && leftSubMax > middleSubMax {
        return leftSubMax
    } else if rightSubMax > leftSubMax && rightSubMax > middleSubMax {
        return rightSubMax
    } else {
        return middleSubMax
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
    let array: [Int] = inputArray.map { Int($0) ?? 0 }
    var result: Int = 0
    
    //MARK: - Process
    result = getSubMax(array, 0, n - 1)
    
    //MARK: - Output
    print(result)
}
solution()
