//
//  main.swift
//  SortString
//
//  Created by 이영재 on 2022/03/10.
//MARK: - 문자열 정렬

//MARK: - Framework
import Foundation

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var str: [String] = []
    var answer: String = ""
    
    for _ in 0..<n {
        guard let input = readLine() else { return }
        str.append(input)
    }
    
    //MARK: - Process
    for i in 0..<n - 1 {
        var temp: String = ""
        
        for j in i + 1..<n {
            if str[i].count < str[j].count {
                for k in 0..<str[i].count {
                    if str[i][str[i].index(str[i].startIndex, offsetBy: k)] == str[j][str[j].index(str[j].startIndex, offsetBy: k)] {
                        continue
                    } else if str[i][str[i].index(str[i].startIndex, offsetBy: k)] > str[j][str[j].index(str[j].startIndex, offsetBy: k)] {
                        temp = str[i]
                        str[i] = str[j]
                        str[j] = temp
                        break
                    } else {
                        break
                    }
                }
            } else if str[i].count > str[j].count {
                var flag: Bool = false
                
                for k in 0..<str[j].count {
                    if str[i][str[i].index(str[i].startIndex, offsetBy: k)] == str[j][str[j].index(str[j].startIndex, offsetBy: k)] {
                        flag = true
                    } else if str[i][str[i].index(str[i].startIndex, offsetBy: k)] > str[j][str[j].index(str[j].startIndex, offsetBy: k)] {
                        flag = false
                        temp = str[i]
                        str[i] = str[j]
                        str[j] = temp
                        break
                    } else {
                        flag = false
                        break
                    }
                    
                    if flag {
                        temp = str[i]
                        str[i] = str[j]
                        str[j] = temp
                    }
                }
            } else {
                for k in 0..<str[i].count {
                    if str[i][str[i].index(str[i].startIndex, offsetBy: k)] == str[j][str[j].index(str[j].startIndex, offsetBy: k)] {
                        continue
                    } else if str[i][str[i].index(str[i].startIndex, offsetBy: k)] > str[j][str[j].index(str[j].startIndex, offsetBy: k)] {
                        temp = str[i]
                        str[i] = str[j]
                        str[j] = temp
                        break
                    } else {
                        break
                    }
                }
            }
        }
    }
    
    answer += "\n"
    for i in 0..<str.count - 1 {
        answer += "\(str[i])\n"
    }
    answer += "\(str[str.count - 1])"
    
    //MARK: - Output
    print(answer)
}
solution()
