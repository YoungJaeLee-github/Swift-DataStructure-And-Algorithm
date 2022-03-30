//
//  main.swift
//  Permutation
//
//  Created by 이영재 on 2022/03/30.
//MARK: - 순열구하기

//MARK: - Framework
import Foundation

//MARK: - Function
func getPermutation(_ current: Int, _ n: Int, _ r: Int, _ result: inout [Character], _ check: inout [Bool]) -> Void {
    if current >= r {
        var answer: String = ""
        for char in result {
            answer += "\(char)"
        }
        
        print(answer)
    } else {
        for i in 0..<n {
            if !check[i] {
                result[current] = Character(UnicodeScalar(i + 97)!)
                check[i] = true
                getPermutation(current + 1, n, r, &result, &check)
                check[i] = false
            }
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let r: Int = input.map { Int($0) }[1] ?? 0
    var result: [Character] = Array(repeating: " ", count: r + 10)
    var check: [Bool] = Array(repeating: false, count: n + 10)
    
    //MARK: - Process & Output
    getPermutation(0, n, r, &result, &check)
}
solution()
