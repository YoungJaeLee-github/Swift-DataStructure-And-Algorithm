//
//  main.swift
//  PushAlgorithm2
//
//  Created by 이영재 on 2022/05/05.
//MARK: - 밀기 알고리즘 2

//MARK: - Framework
import Foundation

//MARK: - Function
func push(_ array: inout [[Int]], _ N: Int, _ M: Int, _ u: Int, _ d: Int) -> Void {
    //MARK: - 1 ~ u
    var temp: Int = array[1][1]
    
    for i in stride(from: 1, to: u, by: 1) {
        array[i][1] = array[i + 1][1]
    }
    
    for i in stride(from: 1, to: M, by: 1) {
        array[u][i] = array[u][i + 1]
    }
    
    for i in stride(from: u, to: 1, by: -1) {
        array[i][M] = array[i - 1][M]
    }
    
    for i in stride(from: M, to: 2, by: -1) {
        array[1][i] = array[1][i - 1]
    }
    array[1][2] = temp
    
    //MARK: - d ~ N
    temp = array[N][1]
    
    for i in stride(from: N, to: d, by: -1) {
        array[i][1] = array[i - 1][1]
    }
    
    for i in stride(from: 1, to: M, by: 1) {
        array[d][i] = array[d][i + 1]
    }
    
    for i in stride(from: d, to: N, by: 1) {
        array[i][M] = array[i + 1][M]
    }
    
    for i in stride(from: M, to: 2, by: -1) {
        array[N][i] = array[N][i - 1]
    }
    array[N][2] = temp
}

func getResult(_ array: [[Int]], _ N: Int, _ M: Int) -> String {
    var answer: String = ""
    
    for i in stride(from: 1, through: N, by: 1) {
        for j in stride(from: 1, to: M, by: 1) {
            answer += "\(array[i][j]) "
        }
        answer += "\(array[i][M])\n"
    }
    
    return answer
}

func solution() -> Void {
    //MARK: - Input
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
    let N: Int = input[0]
    let M: Int = input[1]
    var answer: String = ""
    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    
    
    for i in stride(from: 1, through: N, by: 1) {
        let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
        for j in stride(from: 1, through: M, by: 1) {
            array[i][j] = numbers[j - 1]
        }
    }
    
    let data: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
    let u: Int = data[0]
    let d: Int = data[1]
    
    //MARK: - Process
    push(&array, N, M, u + 1 , d + 1)
    answer = getResult(array, N, M)
    
    //MARK: - Output
    print(answer)
}
solution()
