//
//  main.swift
//  SecondMin
//
//  Created by 이영재 on 2022/01/27.
//MARK: - 두 번째 최솟값 찾기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    var array: Array<Int> = []
    let numberCount: Int = 9
    var min: Int = 987987987
    var secondMin: Int = 987987987
    var secondMinIndex: Int = 0
    
    //MARK: - process
    for _ in 0..<numberCount {
        guard let input = readLine() else { return }
        let number: Int = Int(input) ?? 0
        array.append(number)
        min = min > number ? number : min
    }
    
    for i in 0..<numberCount {
        if array[i] == min {
            continue
        }
        
        if secondMin > array[i] {
            secondMin = array[i]
            secondMinIndex = i
        }
    }
    
    //MARK: - output
    print(secondMin, secondMinIndex + 1, separator: "\n")
}
solution()

