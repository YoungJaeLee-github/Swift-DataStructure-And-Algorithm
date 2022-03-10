//
//  main.swift
//  IncludeString
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 문자열 포함관계 조사

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let A: String = readLine() else { return }
    guard let B: String = readLine() else { return }
    var flag: Bool = false
    
    //MARK: - Process
    if A.count < B.count {
        flag = false
    } else {
        for i in 0...A.count - B.count {
            var sameCount: Int = 0
            
            for j in 0..<B.count {
                sameCount += B[B.index(B.startIndex, offsetBy: j)] == A[A.index(A.startIndex, offsetBy: i + j)] ? 1 : 0
            }

            if sameCount == B.count {
                flag = true
                break
            }
        }
    }
    
    //MARK: - Output
    print(flag ? "YES" : "NO")
}
solution()
