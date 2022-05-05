//
//  main.swift
//  AirCleaner
//
//  Created by 이영재 on 2022/05/05.
//MARK: - 공기 청정기

//MARK: - Framework
import Foundation

//MARK: - Function
func getAirCleanerRow(_ array: [[Int]], _ R: Int, _ C: Int) -> Int {
    var result: Int = 0
    
    for i in stride(from: 2, through: R - 1, by: 1) {
        if array[i][C] == -1 {
            result = i
            break
        }
    }
    
    return result
}

func abs(_ number: Int) -> Int {
    return number < 0 ? number * -1 : number
}

func spread(_ array: inout [[Int]], _ sum: inout [[Int]], _ R: Int, _ C: Int, _ y: Int, _ x: Int, _ K: Int) -> Void {
    let operand: Int = 2 * (K * K) + (2 * K) + 1
    if array[y][x] < operand {
        return
    }
    
    var count: Int = 0
    for i in stride(from: y - K, through: y + K, by: 1) {
        if i < 1 || i > R {
            continue
        }
        
        for j in stride(from: x - K, through: x + K, by: 1) {
            if j < 1 || j > C {
                continue
            }
            
            if i == y && j == x {
                continue
            }
            
            if array[i][j] == -1 {
                continue
            }
            
            let distance: Int = abs(y - i) + abs(x - j)
            if 1 <= distance && distance <= K {
                sum[i][j] += array[y][x] / operand
                count += 1
            }
        }
    }
    
    array[y][x] -= count * (array[y][x] / operand)
}

func initialize(_ array: inout [[Int]], _ sum: inout [[Int]], _ R: Int, _ C: Int) -> Void {
    for i in stride(from: 1, through: R, by: 1) {
        for j in stride(from: 1, through: C, by: 1) {
            array[i][j] += sum[i][j]
            sum[i][j] = 0
        }
    }
}

func push(_ array: inout [[Int]], _ R: Int, _ C: Int, _ u: Int, _ d: Int) -> Void {
    //MARK: - 1 ~ u
    var temp: Int = array[1][1]
    
    for i in stride(from: 1, to: u, by: 1) {
        array[i][1] = array[i + 1][1]
    }
    
    for i in stride(from: 1, to: C - 1, by: 1) {
        array[u][i] = array[u][i + 1]
    }
    
    array[u][C - 1] = 0
    
    for i in stride(from: u - 1, to: 1, by: -1) {
        array[i][C] = array[i - 1][C]
    }
    
    for i in stride(from: C, to: 2, by: -1) {
        array[1][i] = array[1][i - 1]
    }
    
    array[1][2] = temp
    
    //MARK: - d ~ R
    temp = array[R][1]
    
    for i in stride(from: R, to: d, by: -1) {
        array[i][1] = array[i - 1][1]
    }
    
    for i in stride(from: 1, to: C - 1, by: 1) {
        array[d][i] = array[d][i + 1]
    }
    
    array[d][C - 1] = 0
    
    for i in stride(from: d + 1, to: R, by: 1) {
        array[i][C] = array[i + 1][C]
    }
    
    for i in stride(from: C, to: 2, by: -1) {
        array[R][i] = array[R][i - 1]
    }
    
    array[R][2] = temp
}

func getResult(_ array: [[Int]], _ R: Int, _ C: Int) -> Int {
    var result: Int = 0
    
    for i in stride(from: 1, through: R, by: 1) {
        for j in stride(from: 1, through: C, by: 1) {
            if array[i][j] == -1 {
                continue
            }
            
            result += array[i][j]
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    guard let T: Int = Int(readLine() ?? "0") else { return }
    var t: Int = 1
    var answer: String = ""
    
    //MARK: - Process
    for _ in 0..<T {
        let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
        let R: Int = input[0]
        let C: Int = input[1]
        let S: Int = input[2]
        let K: Int = input[3]
        var array: [[Int]] = Array(repeating: Array(repeating: 0, count: C + 10), count: R + 10)
        var sum: [[Int]] = Array(repeating: Array(repeating: 0, count: C + 10), count: R + 10)
        
        for i in stride(from: 1, through: R, by: 1) {
            let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
            for j in stride(from: 1, through: C, by: 1) {
                array[i][j] = numbers[j - 1]
            }
        }
        
        let u: Int = getAirCleanerRow(array, R, C)
        let d: Int = u + 1
        
        for _ in 0..<S {
            for i in stride(from: 1, through: R, by: 1) {
                for j in stride(from: 1, through: C, by: 1) {
                    if array[i][j] == -1 {
                        continue
                    }
                    spread(&array, &sum, R, C, i, j, K)
                }
            }
            initialize(&array, &sum, R, C)
            push(&array, R, C, u, d)
        }
        
        let r: Int = getResult(array, R, C)
        answer += "#\(t) \(r)\n"
        t += 1
    }
    
    //MARK: - Output
    print(answer)
}
solution()
