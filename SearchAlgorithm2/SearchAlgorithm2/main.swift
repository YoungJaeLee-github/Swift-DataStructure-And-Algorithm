//
//  main.swift
//  SearchAlgorithm2
//
//  Created by 이영재 on 2022/05/18.
//MARK: - 조회 알고리즘 2

//MARK: - Framework
import Foundation

//MARK: - Value
let row: Int = 1000
let col: Int = 1000
var array: [[Int]] = []

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    var answer: String = ""
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
    var n: Int = input[0]
    let k: Int = input[1]
    let t: Int = input[2]
    
    var y: [Int] = Array(repeating: 0, count: n + k * t + 10)
    var x: [Int] = Array(repeating: 0, count: n + k * t + 10)
    var age: [Int] = Array(repeating: 0, count: n + k * t + 10)
    array = Array(repeating: Array(repeating: 0, count: col + 10), count: row + 10)
    
    for i in stride(from: 1, through: n, by: 1) {
        let data: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
        
        y[i] = data[0]
        x[i] = data[1]
        age[i] = data[2]
        
        if array[y[i]][x[i]] == 0 {
            array[y[i]][x[i]] = i
        } else {
            if age[array[y[i]][x[i]]] < age[i] {
                age[array[y[i]][x[i]]] = age[i]
            }
            
            y[i] = 0
            x[i] = 0
            age[i] = 0
        }
    }
    
    //MARK: - Process
    for _ in 0..<t {
        var sum: Int = 0
        for _ in 0..<k {
            let data: [Int] = readLine()!.split(separator: " ").map { Int(String($0)) ?? 0 }
            
            n += 1
            y[n] = data[0]
            x[n] = data[1]
            age[n] = data[2]
            
            if array[y[n]][x[n]] == 0 {
                array[y[n]][x[n]] = n
            } else {
                if age[array[y[n]][x[n]]] < age[n] {
                    age[array[y[n]][x[n]]] = age[n]
                }
                
                y[n] = 0
                x[n] = 0
                age[n] = 0
            }
        }
        
        for i in stride(from: 1, through: n, by: 1) {
            sum += age[array[y[i]][x[i]]]
        }
        answer += "\(sum)\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
