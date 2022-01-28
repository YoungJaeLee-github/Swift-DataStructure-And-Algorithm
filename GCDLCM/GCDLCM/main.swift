//
//  main.swift
//  GCDLCM
//
//  Created by 이영재 on 2022/01/28.
//MARK: - GCD LCM

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func getGcd(_ A: Int, _ B: Int) -> Int {
    return A % B == 0 ? B : getGcd(B, A % B)
}

func getLcm(_ A: Int, _ B: Int, _ gcd: Int) -> Int {
    return A * B / gcd
}

func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let numberOne: Int = input.map { Int($0) }[0] ?? 0
    let numberTwo: Int = input.map { Int($0) }[1] ?? 0
    
    //MARK: - process
    let gcd = getGcd(numberOne, numberTwo)
    let lcm = getLcm(numberOne, numberTwo, gcd)
    
    //MARK: - output
    print(gcd, lcm, separator: "\n")
}
solution()

