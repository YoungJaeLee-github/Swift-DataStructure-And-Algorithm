//
//  main.swift
//  ClassPresident
//
//  Created by 이영재 on 2022/01/28.
//MARK: - class president

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct ClassPresidentInfo {
    //MARK: - Properties
    var studentCount: Int
    var gradeCount: Int
    var classPresident: Int
    var sameGradeCounts: Array<Int>
    var classInfo: Array<Array<Int>>
    
    //MARK: - Initializer
    init(_ studentCount: Int) {
        self.studentCount = studentCount
        self.gradeCount = 5
        self.classPresident = 1
        sameGradeCounts = Array(repeating: 0, count: studentCount + 10)
        self.classInfo = Array(repeating: Array(repeating: 0, count: gradeCount + 10), count: studentCount + 10)
    }
}

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let studentCount: Int = Int(readLine() ?? "0") else { return }
    var classPresidentInfo: ClassPresidentInfo = ClassPresidentInfo(studentCount)
    
    
    for i in 1...studentCount {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        let inputArray: Array<Int> = input.map { Int($0) ?? 0}
        
        for j in 1...classPresidentInfo.gradeCount {
            classPresidentInfo.classInfo[i][j] = inputArray[j - 1]
        }
    }
    
    //MARK: - process
    for i in 1...classPresidentInfo.studentCount {
        var isSameClass: Array<Bool> = Array(repeating: false, count: classPresidentInfo.studentCount + 10)
        for j in 1...classPresidentInfo.gradeCount {
            for k in 1...classPresidentInfo.studentCount {
                if i == k {
                    continue
                }
                
                if isSameClass[k] {
                    continue
                }
                
                if classPresidentInfo.classInfo[i][j] == classPresidentInfo.classInfo[k][j] {
                    classPresidentInfo.sameGradeCounts[i] += 1
                    isSameClass[k] = true
                }
            }
        }
    }
    
    for i in 1...classPresidentInfo.studentCount {
        classPresidentInfo.classPresident = classPresidentInfo.sameGradeCounts[classPresidentInfo.classPresident] < classPresidentInfo.sameGradeCounts[i] ? i : classPresidentInfo.classPresident
    }
    
    //MARK: - output
    print(classPresidentInfo.classPresident)
}
solution()

