//
//  main.swift
//  Palindrome
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 팰린드롬 조사

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str: String = readLine() else { return }
    var isPalindrome: Bool = true
    var start: Int = 0
    var end: Int = str.count - 1
    
    //MARK: - Process
    while start < end {
        if str[str.index(str.startIndex, offsetBy: start)] != str[str.index(str.startIndex, offsetBy: end)] {
            isPalindrome = false
            break
        }
        
        start += 1
        end -= 1
    }
    
    //MARK: - Output
    print(isPalindrome ? "YES" : "NO")
}
solution()
