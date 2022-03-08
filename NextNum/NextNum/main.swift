//
//  main.swift
//  NextNum
//
//  Created by 이영재 on 2022/03/07.
//MARK: - nextnum

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    var answer: String = ""
    
    while true {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        let a1: Int = input.map { Int($0) }[0] ?? 0
        let a2: Int = input.map { Int($0) }[1] ?? 0
        let a3: Int = input.map { Int($0) }[2] ?? 0
        var flag: Bool = false
        var nextNum: Int = 0
        
        if a1 == 0 && a2 == 0 && a3 == 0 {
            break
        }
        
        if (a2 - a1) == (a3 - a2) {
            flag = true
        }
        
        if flag {
            nextNum = a3 + (a2 - a1)
            answer += "AP \(nextNum)\n"
            
        } else {
            nextNum = a3 * (a2 / a1)
            answer += "GP \(nextNum)\n"
        }
    }
    
    print(answer)
}
solution()
