//
//  main.swift
//  Hunter
//
//  Created by 이영재 on 2022/05/18.
//MARK: - 밀렵꾼

//MARK: - Framework
import Foundation

//MARK: - Function
func moveAlgorithm2(_ M: Int, _ R: Int, _ C: Int, _ array: inout [[Int]], _ y: inout [Int], _ x: inout [Int], _ d: inout [Int], _ f: [Int]) -> Void {
    for i in stride(from: 1, through: M, by: 1) {
        array[y[i]][x[i]] = 0
        var tempF: Int = f[i]
        
        if d[i] == 0 || d[i] == 1 {
            tempF %= (R - 1) * 2
        } else {
            tempF %= (C - 1) * 2
        }
        
        while tempF > 0 {
            switch d[i] {
            case 1:
                if y[i] - tempF >= 1 {
                    y[i] -= tempF
                    tempF = 0
                } else {
                    tempF -= (y[i] - 1)
                    y[i] = 1
                    d[i] = 2
                }
            case 2:
                if y[i] + tempF <= R {
                    y[i] += tempF
                    tempF = 0
                } else {
                    tempF -= (R - y[i])
                    y[i] = R
                    d[i] = 1
                }
            case 3:
                if x[i] - tempF >= 1 {
                    x[i] -= tempF
                    tempF = 0
                } else {
                    tempF -= (x[i] - 1)
                    x[i] = 1
                    d[i] = 4
                }
            case 4:
                if x[i] + tempF <= C {
                    x[i] += tempF
                    tempF = 0
                } else {
                    tempF -= (C - x[i])
                    x[i] = C
                    d[i] = 3
                }
            default:
                break
            }
        }
    }
}

func searchAlgorithm2(_ M: Int, _ array: inout [[Int]], _ y: inout [Int], _ x: inout [Int], _ d: inout [Int], _ f: inout [Int], _ w: inout [Int]) -> Void {
    for i in stride(from: 1, through: M, by: 1) {
        if array[y[i]][x[i]] == 0 {
            array[y[i]][x[i]] = i
        } else {
            if w[array[y[i]][x[i]]] < w[i] {
                d[array[y[i]][x[i]]] = d[i]
                f[array[y[i]][x[i]]] = f[i]
                w[array[y[i]][x[i]]] = w[i]
            }
            
            y[i] = 0
            x[i] = 0
            d[i] = 0
            f[i] = 0
            w[i] = 0
        }
    }
}

func huntAlgorithm(_ R: Int, _ col: Int, _ array: inout [[Int]], _ y: inout [Int], _ x: inout [Int], _ d: inout [Int], _ f: inout [Int], _ w: inout [Int]) -> Int {
    var result: Int = 0
    
    for i in stride(from: R, through: 1, by: -1) {
        if array[i][col] != 0 {
            result = w[array[i][col]]
            y[array[i][col]] = 0
            x[array[i][col]] = 0
            d[array[i][col]] = 0
            f[array[i][col]] = 0
            x[array[i][col]] = 0
            array[i][col] = 0
            break
        }
    }
    
    return result
}

func solution() -> Void {
    //MARK: - Input
    let T: Int = Int(readLine() ?? "0") ?? 0
    var t: Int = 0
    var answer: String = ""
    
    //MARK: - Process
    for _ in 0..<T {
        var r: Int = 0
        
        let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
        let R: Int = input[0]
        let C: Int = input[1]
        let M: Int = input[2]
        
        var y: [Int] = Array(repeating: 0, count: M + 10)
        var x: [Int] = Array(repeating: 0, count: M + 10)
        var d: [Int] = Array(repeating: 0, count: M + 10)
        var f: [Int] = Array(repeating: 0, count: M + 10)
        var w: [Int] = Array(repeating: 0, count: M + 10)
        var array: [[Int]] = Array(repeating: Array(repeating: 0, count: C + 10), count: R + 10)
        
        for i in stride(from: 1, through: M, by: 1) {
            let data: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
            y[i] = data[0]
            x[i] = data[1]
            d[i] = data[2]
            f[i] = data[3]
            w[i] = data[4]
            
            array[y[i]][x[i]] = i
        }
        
        for i in stride(from: 1, through: C, by: 1) {
            moveAlgorithm2(M, R, C, &array, &y, &x, &d, f)
            searchAlgorithm2(M, &array, &y, &x, &d, &f, &w)
            r += huntAlgorithm(R, i, &array, &y, &x, &d, &f, &w)
        }
        
        t += 1
        answer += "#\(t) \(r)\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
