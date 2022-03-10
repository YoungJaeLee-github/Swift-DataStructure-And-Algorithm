//
//  main.swift
//  BigNumberSubtraction
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 큰 자릿수 뺄셈

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let A: String = readLine() else { return }
    guard let B: String = readLine() else { return }
    var answer: String = ""
    var smallNumberIndex: Int = 0
    var zeroCount: Int = 0
    var flag: Bool = false
    var sub: [Int] = []
    var bigNumber: [Int] = []
    var smallNumber: [Int] = []
    
    //MARK: - Process
    if A.count < B.count {
        flag = true
    } else if A.count > B.count {
        flag = false
    } else {
        for i in 0..<B.count {
            if A[A.index(A.startIndex, offsetBy: i)] < B[B.index(B.startIndex, offsetBy: i)] {
                flag = true
                break
            }
        }
    }
    
    if flag {
        sub = Array(repeating: 0, count: B.count)
        bigNumber = Array(repeating: 0, count: B.count)
        smallNumber = Array(repeating: 0, count: B.count)
        answer += "-"   //B가 더 큰 경우에는 음수처리
        
        for i in stride(from: B.count - 1, through: 0, by: -1) {
            bigNumber[i] = Int(B[B.index(B.startIndex, offsetBy: i)].asciiValue! - 48)
        }
        
        smallNumberIndex = A.count - 1
        for i in stride(from: B.count - 1, through: B.count - A.count, by: -1) {
            smallNumber[i] = Int(A[A.index(A.startIndex, offsetBy: smallNumberIndex)].asciiValue! - 48)
            
            smallNumberIndex -= 1
        }
        
        for i in 0..<B.count {
            sub[i] = bigNumber[i] - smallNumber[i]
        }
    } else {
        sub = Array(repeating: 0, count: A.count)
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
        
        for i in 0..<A.count {
            sub[i] = bigNumber[i] - smallNumber[i]
        }
    }
    
    for i in stride(from: sub.count - 1, to: 0, by: -1) {
        if sub[i] < 0 {
            sub[i - 1] -= 1
            sub[i] += 10
        }
    }
    
    //앞 0처리
    for number in sub {
        if number > 0 {
            break
        }
        
        zeroCount += 1
    }
    
    if zeroCount == 1 {
        answer += "\(0)"
    } else {
        for i in zeroCount..<sub.count {
            answer += "\(sub[i])"
        }
    }
    
    //MARK: - Output
    print(answer)
}
solution()
