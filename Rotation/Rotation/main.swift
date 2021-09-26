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
    let n: Int = rotationInfo[0]!   //회전판의 층 수
    let m: Int = rotationInfo[1]!   //회전판의 데이터 수
    var k: Int = rotationInfo[2]!   //회전 횟수
    
    //회전판의 정보를 담기 위한 배열
    var rotation: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: m + 2), count: n + 2)
    //지워진 원소인지 판별하기 위한 배열
    var check: Array<Array<Bool>> = Array(repeating: Array(repeating: false, count: m + 2), count: n + 2)
    
    //Modeling
    modelingRotation(&rotation, n, m)
    
    while k > 0 {
        let rotationDataInfo = readLine()!.components(separatedBy: " ").map{ Int($0) }
        let a = rotationDataInfo[0]!    //회전할 층 수(a의 배수는 모두 회전)
        let d = rotationDataInfo[1]!    //회전 방향 0인경우 오른쪽 회전, 1인 경우 왼쪽 회전
        let c = rotationDataInfo[2]!    //회전할 칸 수
        
        //push(회전) 호출
        push(&rotation, n, m, a, d, c)
        
        if !search(rotation, &check, n, m) {
            averageRotation(&rotation, n, m)
        } else {
            removeData(&rotation, &check, n, m)
        }
        k -= 1
    }
    //결과 출력
    print("#\(answerCount) \(getSum(rotation, n, m))")
    
    answerCount += 1
    testCase -= 1
}

func modelingRotation(_ array: inout Array<Array<Int>>, _ n: Int, _ m: Int) -> Void {
    //메모리 참조 오류를 방지하기 위해 경계를 -1로 초기화
    for i in 0..<m + 2 {
        array[0][i] = -1
        array[n + 1][i] = -1
    }
    
    for i in 1..<n + 1 {
        let rotationData = readLine()!.components(separatedBy: " ").map{ Int($0) }
        for j in 0..<m + 2 {
            if j == 0 || j == m + 1 {
                array[i][j] = -1
            }
        }
        for k in 0..<rotationData.count {
            array[i][k + 1] = rotationData[k]!
        }
    }
}

func push(_ array: inout Array<Array<Int>>, _ n: Int, _ m: Int, _ a: Int, _ d: Int, _ c: Int) -> Void {
    for i in 1...n {
        //a의 배수층들은 동시에 회전
        if i % a == 0 {
            switch d {
            case 0:
                for _ in 0..<c {
                    //오른쪽으로 회전하게 되면 마지막 원소가 밀리게 되므로 임시 변수에 저장
                    let lastData: Int = array[i][m]
                    for j in stride(from: m - 1, through: 1, by: -1) {
                        array[i][j + 1] = array[i][j]
                    }
                    array[i][1] = lastData
                }
            case 1:
                for _ in 0..<c {
                    //왼쪽으로 회전하게 되면 첫번째 원소가 밀리게 되므로 임시 변수에 저장
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

func search(_ array: Array<Array<Int>>, _ check: inout Array<Array<Bool>>, _ n: Int, _ m: Int) -> Bool {
    //지워진게 하나라도 있는지 판별하기 위한 변수
    var isSame: Bool = false
    for i in 1...n {
        for j in 1...m {
            if array[i][j] != 0 {
                //상하좌우를 접근하기 위한 임시변수
                let tempTop: Int = i - 1
                let tempBottom: Int = i + 1
                let tempLeft: Int = j - 1 == 0 ? m : j - 1
                let tempRight: Int = j + 1 == m + 1 ? 1 : j + 1
                
                if array[i][j] == array[tempTop][j] || array[i][j] == array[tempBottom][j]
                    || array[i][j] == array[i][tempLeft] || array[i][j] == array[i][tempRight] {
                    isSame = true
                    check[i][j] = true
                }
            }
        }
    }
    return isSame
}

func averageRotation(_ array: inout Array<Array<Int>>, _ n: Int, _ m: Int) -> Void {
    //지워진게 하나도 없는 경우
    var sum: Int = 0
    var average: Int = 0
    var count: Int = 0
    
    for i in 1...n {
        for j in 1...m {
            if array[i][j] != 0 {
                sum += array[i][j]
                count += 1
            }
        }
    }
    
    //처음 회전 때 모두 같은 원소여서 다 지워진 경우 이후 회전에는 지워진 원소가 없게 되므로 예외처리
    if count == 0 {
        return
    }
    
    //소수점 아래의 자리수는 버림
    average = sum / count
    
    //평균보다 작은 경우는 +1, 큰 경우는 - 1, 같은 경우는 고려하지 않음
    //이후 같은 것을 지우는 것이 아닌 다시 회전을 진행함
    for i in 1...n {
        for j in 1...m {
            if array[i][j] != 0 {
                if average < array[i][j] {
                    array[i][j] -= 1
                } else if average > array[i][j] {
                    array[i][j] += 1
                }
            }
        }
    }
}

func removeData(_ array: inout Array<Array<Int>>, _ check: inout Array<Array<Bool>>, _ n: Int, _ m: Int) -> Void {
    for i in 1...n {
        for j in 1...m {
            if check[i][j] == true {
                array[i][j] = 0
                //다음 회전을 위해 초기화
                check[i][j] = false
            }
        }
    }
}

func getSum(_ array: Array<Array<Int>>, _ n: Int, _ m: Int) -> Int {
    var answer: Int = 0
    for i in 1...n {
        for j in 1...m {
            answer += array[i][j]
        }
    }
    return answer
}
