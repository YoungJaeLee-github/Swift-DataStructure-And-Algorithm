//
//  main.swift
//  Beehive
//
//  Created by 이영재 on 2022/03/08.
//MARK: - beehive

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let N: Int = Int(readLine() ?? "0") else { return }
    var sum: Int = 1
    var cycle: Int = 6
    var roomCount: Int = 1
    
    //MARK: - Process
    while sum < N {
        sum += cycle
        cycle += 6
        roomCount += 1
    }
    
    //MARK: - Output
    print(roomCount)
}
solution()
