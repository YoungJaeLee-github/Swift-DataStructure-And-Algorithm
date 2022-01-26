//
//  main.swift
//  YutPlay
//
//  Created by 이영재 on 2022/01/24.
//MARK: - 윷놀이

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    var time: Int = 3
    
    while time > 0 {
        //MARK: - input
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        let Yut = input.map { Int($0) }
        var backCount: Int = 0
        
        //MARK: - process
        for yut in Yut {
            backCount += yut == 0 ? 1 : 0
        }
        
        //MARK: - output
        switch backCount {
        case 0:
            print("E")
        case 1:
            print("A")
        case 2:
            print("B")
        case 3:
            print("C")
        case 4:
            print("D")
        default:
            break
        }
        
        time -= 1
    }
}

solution()

