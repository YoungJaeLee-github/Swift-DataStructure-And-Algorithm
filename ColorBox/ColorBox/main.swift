//
//  main.swift
//  ColorBox
//
//  Created by 이영재 on 2022/01/28.
//MARK: - 상자 꾸미기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let N = Int(readLine() ?? "0") else { return }
    guard let inputCandidates = readLine()?.components(separatedBy: " ") else { return }
    let candidates: Array<Int> = inputCandidates.map { Int($0) ?? 0}
    var papers: Array<Int> = Array(repeating: 0, count: N + 10)
    var possibleCount: Int = 6
    var answer: String = ""
    
    //MARK: - process
    for candidate in candidates {
        papers[candidate] += 1
    }
    
    for paper in papers {
        if paper == 0 {
            continue
        }
        possibleCount += paper < 2 ? -paper : -2
    }
    answer = possibleCount > 0 ? "NO" : "YES"
    
    //MARK: - output
    print(answer)
}
solution()

