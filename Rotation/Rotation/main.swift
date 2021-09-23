//
//  main.swift
//  Rotation
//
//  Created by 이영재 on 2021/09/23.
//
//MARK: - 회전탑
import Foundation


var testCase: Int = Int(readLine()!)!
var answerCount: Int = 1
while testCase > 0 {
    let rotationInfo = readLine()!.components(separatedBy: " ").map{ Int($0) }
    let n: Int = rotationInfo[0]!
    let m: Int = rotationInfo[1]!
    var k: Int = rotationInfo[2]!
    
    var rotation: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: m + 2), count: n + 2)
    var check: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: m + 2), count: n + 2)
    
    for i in 0..<m + 2 {
        rotation[0][i] = -1
        rotation[n + 1][i] = -1
    }
    
    for i in 1..<n + 1 {
        let rotationData = readLine()!.components(separatedBy: " ").map{ Int($0) }
        for j in 0..<m + 2 {
            if j == 0 || j == m + 1 {
                rotation[i][j] = -1
            }
        }
        for k in 0..<rotationData.count {
            rotation[i][k + 1] = rotationData[k]!
        }
    }
    
    while k > 0 {
        let rotationDataInfo = readLine()!.components(separatedBy: " ").map{ Int($0) }
        let a = rotationDataInfo[0]!
        let d = rotationDataInfo[1]!
        let c = rotationDataInfo[2]!
        
        //push 호출
        push(&rotation, n, m, a, d, c)
        push(&check, n, m, a, d, c)
        
        //search 호출
        search(&rotation, &check, n, m)
        
        k -= 1
    }
    //남아있는 수들의 합 계산
    var answer: Int = 0
    for i in 1...n {
        for j in 1...m {
            if check[i][j] != -1 {
                answer += rotation[i][j]
            }
        }
    }
    //결과 출력
    print("#\(answerCount) \(answer)")
    
    answerCount += 1
    testCase -= 1
}

func push(_ array: inout Array<Array<Int>>, _ n: Int, _ m: Int, _ a: Int, _ d: Int, _ c: Int) -> Void {
    for i in 1...n {
        if i % a == 0 {
            switch d {
            case 0:
                for _ in 0..<c {
                    let lastData: Int = array[i][m]
                    for j in stride(from: m - 1, through: 1, by: -1) {
                        array[i][j + 1] = array[i][j]
                    }
                    array[i][1] = lastData
                }
            case 1:
                for _ in 0..<c {
                    let firstData: Int = array[i][1]
                    for j in 2...m {
                        array[i][j - 1] = array[i][j]
                    }
                    array[i][m] = firstData
                }
            default:
                break
            }
        }
    }
}

func search(_ array: inout Array<Array<Int>>, _ check: inout Array<Array<Int>>, _ n: Int, _ m: Int) -> Void {
    var isSame: Bool = false
    for i in 1...n {
        for j in 1...m {
            if check[i][j] != -1 {
                let tempTop: Int = i - 1
                let tempBottom: Int = i + 1
                let tempLeft: Int = j - 1 == 0 ? m : j - 1
                let tempRight: Int = j + 1 == m + 1 ? 1 : j + 1
                
                if array[i][j] == array[tempTop][j] {
                    isSame = true
                    check[i][j] = -1
                    check[tempTop][j] = -1
                }
                if array[i][j] == array[tempBottom][j] {
                    isSame = true
                    check[i][j] = -1
                    check[tempBottom][j] = -1
                }
                if array[i][j] == array[i][tempLeft] {
                    isSame = true
                    check[i][j] = -1
                    check[i][tempLeft] = -1
                }
                if array[i][j] == array[i][tempRight] {
                    isSame = true
                    check[i][j] = -1
                    check[i][tempRight] = -1
                }
            }
        }
    }
    
    if !isSame {
        var sum: Int = 0
        var average: Int = 0
        var count: Int = 0
        
        for i in 1...n {
            for j in 1...m {
                if check[i][j] != -1 {
                    sum += array[i][j]
                    count += 1
                }
            }
        }
        
        average = sum / count
        
        for i in 1...n {
            for j in 1...m {
                if check[i][j] != -1 {
                    if average < array[i][j] {
                        array[i][j] -= 1
                    } else if average > array[i][j] {
                        array[i][j] += 1
                    }
                }
            }
        }
    }
}
