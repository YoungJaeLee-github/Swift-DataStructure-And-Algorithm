//
//  main.swift
//  Streetree
//
//  Created by 이영재 on 2022/03/08.
//MARK: - streetree

//MARK: - Framework
import Foundation

//MARK: - Function
func getGCD(_ A: Int, _ B: Int) -> Int {
    return A % B == 0 ? B : getGCD(B, A % B)
}

func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var answer: Int = 0
    var difference: Int
    var trees: [Int] = []
    var differences: [Int] = Array(repeating: 0, count: N + 10)
    
    for _ in 0..<N {
        guard let tree: Int = Int(readLine() ?? "0") else { return }
        trees.append(tree)
    }
    
    //MARK: - Process
    for i in 1..<N {
        differences[i - 1] = trees[i] - trees[i - 1]
    }
    
    difference = differences[0]
    for i in 1..<(N - 1) {
        difference = getGCD(difference, differences[i])
    }
    
    answer = (trees[N - 1] - trees[0]) / difference + 1 - N
    
    //MARK: - Output
    print(answer)
}
solution()
