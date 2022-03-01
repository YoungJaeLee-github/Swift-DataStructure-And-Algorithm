//
//  main.swift
//  InsertionSort
//
//  Created by 이영재 on 2022/03/01.
//MARK: - 삽입정렬(Insertion Sort)

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    var array: Array<Int> = input.map { Int($0) ?? 0 }
    
    //MARK: - process
    for i in 1..<N {
        for j in stride(from: i, to: 0, by: -1) {
            if array[j - 1] > array[j] {
                let temp: Int = array[j - 1]
                array[j - 1] = array[j]
                array[j] = temp
            }
        }
    }
    
    //MARK: - output
    for data in array {
        print(data, terminator: " ")
    }
}
solution()
