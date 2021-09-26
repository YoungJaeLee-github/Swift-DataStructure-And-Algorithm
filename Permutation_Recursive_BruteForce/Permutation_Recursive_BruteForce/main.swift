//
//  main.swift
//  Permutation_Recursive_BruteForce
//
//  Created by 이영재 on 2021/09/27.
//MARK: - 순열 : 재귀호출을 이용한 완전탐색 알고리즘 풀이
import Foundation

if let input = readLine() {
    let n: Int = input.components(separatedBy: " ").map{ Int($0) }[0] ?? 0
    let r: Int = input.components(separatedBy: " ").map{ Int($0) }[1] ?? 0
    
    var result: Array<Character> = Array(repeating: "0", count: r)
    var check: Array<Bool> = Array(repeating: false, count: n)

    func getPermutation(_ current: Int) -> Void {
        if current >= r {
            for i in result {
                print(i, terminator: "")
            }
            print()
        } else {
            for i in 0..<n {
                if check[i] == false {
                    let alpha: Character = Character(UnicodeScalar(i + 97)!)
                    result[current] = alpha
                    check[i] = true
                    getPermutation(current + 1)
                    check[i] = false
                }
            }
        }
    }

    getPermutation(0)
    
} else {
    print("잘못된 입력입니다.")
}
