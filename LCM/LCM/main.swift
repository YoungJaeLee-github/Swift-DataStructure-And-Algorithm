//
//  main.swift
//  LCM
//
//  Created by 이영재 on 2022/03/08.
//MARK: - lcm

//MARK: - Framework
import Foundation

//MARK: - Function
func getGCD(_ A: Int64, _ B: Int64) -> Int64 {
    return A % B == 0 ? B : getGCD(B, A % B)
}

func getLCM(_ A: Int64, _ B: Int64) -> Int64 {
    return A * B / getGCD(A, B)
}

func soluton() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let A: Int64 = input.map { Int64($0) }[0] ?? 0
    let B: Int64 = input.map { Int64($0) }[1] ?? 0
    var lcm: Int64 = 0
    
    //MARK: - Process
    lcm = getLCM(A, B)
    
    //MARK: - Output
    print(lcm)
}
soluton()
