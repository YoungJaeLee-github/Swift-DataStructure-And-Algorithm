//
//  main.swift
//  Fmttalpha
//
//  Created by 이영재 on 2022/03/08.
//MARK: - fmttalpha

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let x: Int = input.map { Int($0) }[0] ?? 0
    let y: Int = input.map { Int($0) }[1] ?? 0
    var moveCount: Int = 0
    
    //MARK: - Process
    if y - x == 1 {
        moveCount = 1
    } else if y - x == 2 {
        moveCount = 2
    } else {
        // y - x >= 3
        var maxDistance: Int = 2
        var cycle: Int = 2
        moveCount = 2
        
        while y - x > maxDistance {
            for _ in 0..<cycle {
                if y - x <= maxDistance {
                    break
                }
                maxDistance += cycle
                moveCount += 1
            }
            
            cycle += 1
        }
    }
    
    //MARK: - Output
    print(moveCount)
}
solution()
