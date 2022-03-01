//
//  main.swift
//  BubbleSort
//
//  Created by 이영재 on 2022/03/01.
//MARK: - 버블정렬(Bubble Sort)

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    var array: Array<Int> = input.map { Int($0) ?? 0 }
    
    //MARK: - process
    for i in stride(from: N - 1, to: 0, by: -1) {
        for j in 0..<i {
            if array[j] > array[j + 1] {
                let temp: Int = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
    
    //MARK: - output
    for data in array {
        print(data, terminator: " ")
    }
}
solution()
