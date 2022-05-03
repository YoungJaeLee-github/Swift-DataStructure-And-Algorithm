//
//  main.swift
//  RotationTower
//
//  Created by 이영재 on 2022/05/01.
//MARK: - 회전탑

//MARK: - Framework
import Foundation

//MARK: - Function
func rotation(_ array: inout [[Int]], _ N: Int, _ M: Int, _ a: Int, _ d: Int, _ c: Int) -> Void {
    switch d {
    case 0:
        for i in stride(from: 1, through: N, by: 1) {
            if i % a == 0 {
                for _ in 0..<c {
                    let last: Int = array[i][M]
                    for j in stride(from: M, to: 1, by: -1) {
                        array[i][j] = array[i][j - 1]
                    }
                    array[i][1] = last
                }
            }
        }
    case 1:
        for i in stride(from: 1, through: N, by: 1) {
            if i % a == 0 {
                for _ in 0..<c {
                    let first: Int = array[i][1]
                    for j in stride(from: 1, to: M, by: 1) {
                        array[i][j] = array[i][j + 1]
                    }
                    array[i][M] = first
                }
            }
        }
    default:
        break
    }
}

func search(_ array: inout [[Int]], _ N: Int, _ M: Int) -> Void {
    let dy: [Int] = [0, 0, -1, 1]
    let dx: [Int] = [-1 ,1, 0, 0]
    var isRemove: Bool = false
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    
    for i in stride(from: 1, through: N, by: 1) {
        for j in stride(from: 1, through: M, by: 1) {
            if array[i][j] == 0 {
                continue
            }
            
            var flag: Bool = false
            
            for k in 0..<4 {
                if array[i][j] == 0 {
                    continue
                }
                
                if array[i][j] == array[i + dy[k]][j + dx[k]] {
                    flag = true
                    isRemove = true
                }
            }
            
            result[i][j] = flag ? 1 : 0
        }
        
        if array[i][1] != 0 && array[i][M] != 0 && array[i][1] == array[i][M] {
            result[i][1] = 1
            result[i][M] = 1
            isRemove = true
        }
    }
    
    if !isRemove {
        var sum: Int = 0, average: Int = 0, count: Int = 0
        for i in stride(from: 1, through: N, by: 1) {
            for j in stride(from: 1, through: M, by: 1) {
                if array[i][j] == 0 {
                    continue
                }
                
                sum += array[i][j]
                count += 1
            }
        }
        
        average = sum / count
        
        for i in stride(from: 1, through: N, by: 1) {
            for j in stride(from: 1, through: M, by: 1) {
                if array[i][j] == 0 || array[i][j] == average {
                    continue
                }
                
                array[i][j] += array[i][j] > average ? -1 : 1
            }
        }
    } else {
        for i in stride(from: 1, through: N, by: 1) {
            for j in stride(from: 1, through: M, by: 1) {
                array[i][j] = result[i][j] == 1 ? 0 : array[i][j]
            }
        }
    }
}

func getResult(_ array: [[Int]], _ N: Int, _ M: Int) -> Int {
    var result: Int = 0
    
    for i in stride(from: 1, through: N, by: 1) {
        for j in stride(from: 1, through: M, by: 1) {
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
        guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
        let N: Int = input.map { Int($0) }[0] ?? 0
        let M: Int = input.map { Int($0) }[1] ?? 0
        let K: Int = input.map { Int($0) }[2] ?? 0
        var array: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
        var r: Int = 0
        
        for i in stride(from: 1, through: N, by: 1) {
            guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
            let numbers: [Int] = inputArray.map { Int($0) ?? 0 }
            
            for j in stride(from: 1, through: M, by: 1) {
                array[i][j] = numbers[j - 1]
            }
        }
        
        
        for _ in 0..<K {
            guard let data: [String] = readLine()?.components(separatedBy: " ") else { return }
            let a: Int = data.map { Int($0) }[0] ?? 0
            let d: Int = data.map { Int($0) }[1] ?? 0
            let c: Int = data.map { Int($0) }[2] ?? 0
            
            rotation(&array, N, M, a, d, c)
            search(&array, N, M)
        }
        r = getResult(array, N, M)
        
        answer += "#\(t) \(r)\n"
        t += 1
    }
    
    //MARK: - Output
    print(answer)
}
solution()
