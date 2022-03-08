//
//  main.swift
//  FractionSum
//
//  Created by 이영재 on 2022/03/08.
//MARK: - fractionsum

//MARK: - Framework
import Foundation

//MARK: - Function
func getGCD(_ A: Int, _ B: Int) -> Int {
    return A % B == 0 ? B : getGCD(B, A % B)
}

func getLCM(_ A: Int, _ B: Int) -> Int {
    return A * B / getGCD(A, B)
}

func solution() -> Void {
    //MARK: - Input
    guard let inputOne = readLine()?.components(separatedBy: " ") else { return }
    guard let inputTwo = readLine()?.components(separatedBy: " ") else { return }
    var childOne: Int = inputOne.map { Int($0) }[0] ?? 0
    var parentOne: Int = inputOne.map { Int($0) }[1] ?? 0
    var childTwo: Int = inputTwo.map { Int($0) }[0] ?? 0
    var parentTwo: Int = inputTwo.map { Int($0) }[1] ?? 0
    var gcd: Int = 0
    var lcm: Int = 0
    var resultChild: Int = 0
    var resultParent: Int = 0
    
    //MARK: - Process
    gcd = getGCD(childOne, parentOne)
    childOne /= gcd
    parentOne /= gcd
    
    gcd = getGCD(childTwo, parentTwo)
    childTwo /= gcd
    parentTwo /= gcd
    
    lcm = getLCM(parentOne, parentTwo)
    resultChild = childOne * (lcm / parentOne) + childTwo * (lcm / parentTwo)
    resultParent = lcm
    
    //MARK: - Output
    print("\(resultChild) \(resultParent)")
}
solution()
