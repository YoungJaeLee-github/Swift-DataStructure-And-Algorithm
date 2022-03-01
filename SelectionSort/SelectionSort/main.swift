//
//  main.swift
//  SelectionSort
//
//  Created by 이영재 on 2022/03/01.
//MARK: - 선택정렬(Selection Sort)

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    var array: Array<Int> = input.map { Int($0) ?? 0 }
    
    //MARK: - process
    for i in 0..<N {
        var index: Int = i
        for j in (i + 1)..<N {
            if array[j] < array[i] {
                index = j
            }
        }
        
        let temp: Int = array[index]
        array[index] = array[i]
        array[i] = temp
    }
    
    //MARK: - output
    for data in array {
        print("\(data) ", terminator: "")
    }
}
solution()
