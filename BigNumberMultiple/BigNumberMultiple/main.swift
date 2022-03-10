//
//  main.swift
//  BigNumberMultiple
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 큰 자릿수 곱셈

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let A: String = readLine() else { return }
    guard let B: String = readLine() else { return }
    var answer: String = ""
    var smallNumberIndex: Int = 0
    var flag: Bool = false
    var multiple: [Int] = []
    var bigNumber: [Int] = []
    var smallNumber: [Int] = []
    
    //MARK: - Process
    if A.count < B.count {
        flag = true
    }
    
    if flag {
        multiple = Array(repeating: 0, count: B.count + (A.count - 1))
        bigNumber = Array(repeating: 0, count: B.count)
        smallNumber = Array(repeating: 0, count: B.count)
        
        for i in stride(from: B.count - 1, through: 0, by: -1) {
            bigNumber[i] = Int(B[B.index(B.startIndex, offsetBy: i)].asciiValue! - 48)
        }
        
        smallNumberIndex = A.count - 1
        for i in stride(from: B.count - 1, through: B.count - A.count, by: -1) {
            smallNumber[i] = Int(A[A.index(A.startIndex, offsetBy: smallNumberIndex)].asciiValue! - 48)
            
            smallNumberIndex -= 1
        }
        
        smallNumberIndex = A.count - 1
        for i in stride(from: B.count - 1, through: B.count - A.count, by: -1) {
            for j in stride(from: B.count - 1, through: 0, by: -1) {
                multiple[smallNumberIndex + j] += bigNumber[j] * smallNumber[i]
            }
            
            smallNumberIndex -= 1
        }
    } else {
        multiple = Array(repeating: 0, count: A.count + (B.count - 1))
        bigNumber = Array(repeating: 0, count: A.count)
        smallNumber = Array(repeating: 0, count: A.count)
        
        for i in stride(from: A.count - 1, through: 0, by: -1) {
            bigNumber[i] = Int(A[A.index(A.startIndex, offsetBy: i)].asciiValue! - 48)
        }
        
        smallNumberIndex = B.count - 1
        for i in stride(from: A.count - 1, through: A.count - B.count, by: -1) {
            smallNumber[i] = Int(B[B.index(B.startIndex, offsetBy: smallNumberIndex)].asciiValue! - 48)
            
            smallNumberIndex -= 1
        }
        
        smallNumberIndex = B.count - 1
        for i in stride(from: A.count - 1, through: A.count - B.count, by:  -1) {
            for j in stride(from: A.count - 1, through: 0, by: -1) {
                multiple[smallNumberIndex + j] += bigNumber[j] * smallNumber[i]
            }
            
            smallNumberIndex -= 1
        }
    }
    
    for i in stride(from: multiple.count - 1, to: 0, by: -1) {
        if multiple[i] >= 10 {
            multiple[i - 1] += multiple[i] / 10
            multiple[i] %= 10
        }
    }
    
    for number in multiple {
        answer += "\(number)"
    }
    
    //MARK: - Output
    print(answer)
}
solution()
