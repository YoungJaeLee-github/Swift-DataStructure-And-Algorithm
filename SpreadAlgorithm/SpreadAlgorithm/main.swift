//
//  main.swift
//  SpreadAlgorithm
//
//  Created by 이영재 on 2022/05/05.
//MARK: - 확산 알고리즘

//MARK: - Framework
import Foundation

//MARK: - Function
func abs(_ number: Int) -> Int {
    return number < 0 ? number * -1 : number
}

func spread(_ array: inout [[Int]], _ sum: inout [[Int]], _ N: Int, _ M: Int, _ y: Int, _ x: Int, _ k: Int) -> Void {
    let operand: Int = 2 * (k * k) + (2 * k) + 1
    var count: Int = 0
    
    for i in stride(from: y - k, through: y + k, by: 1) {
        if i < 1 || i > N {
            continue
        }
        
        for j in stride(from: x - k, through: x + k, by: 1) {
            if j < 1 || j > M {
                continue
            }
            
            if i == y && j == x {
                continue
            }
            
            let distance: Int = abs(y - i) + abs(x - j)
            if 1 <= distance && distance <= k {
                sum[i][j] += array[y][x] / operand
                count += 1
            }
        }
    }
    
    array[y][x] -= count * (array[y][x] / operand)
}

func initiailze(_ array: inout [[Int]], _ sum: inout [[Int]], _ N: Int, _ M: Int) -> Void {
    for i in stride(from: 1, through: N, by: 1) {
        for j in stride(from: 1, through: M, by: 1) {
            array[i][j] += sum[i][j]
            sum[i][j] = 0
        }
    }
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
    let k: Int = input[2]
    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    var sum: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    
    for i in stride(from: 1, through: N, by: 1) {
        let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
        for j in stride(from: 1, through: M, by: 1) {
            array[i][j] = numbers[j - 1]
        }
    }
    
    let t: Int = Int(readLine()!)!
    
    //MARK: - Process
    for _ in 0..<t {
        for i in stride(from: 1, through: N, by: 1) {
            for j in stride(from: 1, through: M, by: 1) {
                spread(&array, &sum, N, M, i, j, k)
            }
        }
        initiailze(&array, &sum, N, M)
    }
    
    let answer: String = getResult(array, N, M)
    
    //MARK: - Output
    print(answer)
}
solution()
