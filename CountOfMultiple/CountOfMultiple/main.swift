//
//  main.swift
//  CountOfMultiple
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 배수의 개수 세기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    var A: Int = input.map { Int($0) }[0] ?? 0
    var B: Int = input.map { Int($0) }[1] ?? 0
    let C: Int = input.map { Int($0) }[2] ?? 0
    var count: Int = 0
    
    //MARK: - process
    if A > B {
        let temp: Int = A
        A = B
        B = temp
    }
    
    for i in A...B {
        count += i % C == 0 ? 1 : 0
    }
    
    //MARK: - output
    print(count)
}
solution()

