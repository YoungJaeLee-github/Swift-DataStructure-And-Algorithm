//
//  main.swift
//  GraphByMatrix
//
//  Created by 이영재 on 2022/04/14.
//MARK: - 그래프 구현 : 인접 행렬

//MARK: - Framework
import Foundation

//MARK: - Function
func isConnected(_ myGraph: [[Int]], _ x: Int, _ y: Int) -> Bool {
    //Time Complexity : O(1)
    return myGraph[x][y] == 1 ? true : false
}

func getAdj(_ myGraph: [[Int]], _ n: Int, _ x: Int) -> Void {
    //Time Complexity : O(n)
    var answer: String = ""
    
    for i in stride(from: 1, to: n, by: 1) {
        if myGraph[x][i] == 1 {
            answer += "\(i) "
        }
    }
    answer += myGraph[x][n] == 1 ? "\(n)" : ""
    
    print(answer)
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var myGraph: [[Int]] = Array(repeating: Array(repeating:0, count: n + 10), count: n + 10)
    
    //MARK: - Process
    for _ in 0..<m {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        myGraph[a][b] = 1
        myGraph[b][a] = 1
    }
    
    //MARK: - Output
    print(isConnected(myGraph, 1, 2))   //true
    print(isConnected(myGraph, 1, 5))   //false
    getAdj(myGraph, n, 1)   //2 3 4
}
solution()
