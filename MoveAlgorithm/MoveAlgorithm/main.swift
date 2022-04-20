//
//  main.swift
//  MoveAlgorithm
//
//  Created by 이영재 on 2022/04/19.
//MARK: - 이동 알고리즘

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    let q: Int = input.map { Int($0) }[2] ?? 0
    var y: Int = 0, x: Int = 0
    var array: [[Int]] = []
    var answer: String = ""
    
    for _ in 0..<N {
        guard let inputArray: [String] = readLine()?.components(separatedBy: " ") else { return }
        let numbers: [Int] = inputArray.map { Int($0) ?? 0 }
        
        array.append(numbers)
    }
    
    //MARK: - Process
    for _ in 0..<q {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let d: Int = inputData.map { Int($0) }[0] ?? 0
        let r: Int = inputData.map { Int($0) }[1] ?? 0
        
        switch d {
        case 0:
            for _ in 0..<r {
                if x + 1 >= M || array[y][x + 1] == -1 {
                    break
                }
                x += 1
            }
        case 1:
            for _ in 0..<r {
                if x - 1 < 0 || array[y][x - 1] == -1 {
                    break
                }
                
                x -= 1
            }
        case 2:
            for _ in 0..<r {
                if y + 1 >= N || array[y + 1][x] == -1 {
                    break
                }
                
                y += 1
            }
        case 3:
            for _ in 0..<r {
                if y - 1 < 0 || array[y - 1][x] == -1 {
                    break
                }
                
                y -= 1
            }
        default:
            break
        }
        
        answer += "\(array[y][x])\n"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
