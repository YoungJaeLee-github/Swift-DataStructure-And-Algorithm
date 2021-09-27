//
//  main.swift
//  Inequal
//
//  Created by 이영재 on 2021/09/27.
//MARK: - inequal - Advanced Brute-Force Algorithm(Recursion)

import Foundation
var printFlag: Bool = false //한 번만 출력해주기 위한 변수
let k: Int = Int(readLine()!)!  //부등호 개수 입력
let inequals = readLine()!.components(separatedBy: " ") //부등호 입력
var result: Array<Int> = Array(repeating: 0, count: k + 1)  //중복을 허용하지 않고, 부등호 조건에 맞는 숫자 구성을 담을 배열
var check: Array<Bool> = Array(repeating: false, count: 10) //중복 검사를 위한 배열

//중복을 허용하지 않으면서 제시된 부등호 관계를 만족하는 수 중
//가장 큰 수를 구하는 함수
func getMaxInequal(_ current: Int) -> Void {
    //최초로 완성된 수가 있으면 함수를 종료
    if printFlag {
        return
    }
    //기저조건(Base Condition)
    if current == k + 1 {
        //모든 재귀호출을 끝마친 후, 완성된 수를 출력 후
        for i in result {
            print(i, terminator:"")
        }
        //해당 수가 최대값이므로 최초로 완성됐다는 표시를 함
        printFlag = true;
    } else {
        //각 자리수는 0~9 정수 이므로, 9부터 시작하여 처음으로 완성된 수가 조건에 맞는 최대값
        for i in stride(from: 9, through: 0, by: -1) {
            //이미 존재하는 수일 경우 다음 수로 넘어감
            if !check[i] {
                //처음 값을 처리해주기 위한 변수
                var flag: Bool = false
                //첫 번째 위치에는 어떤 수가 와도 상관 없으므로 true 표시를 해줌
                if current == 0 {
                    flag = true
                } else {
                    // 그 다음 위치 부터는 부등호 조건에 맞는 수를 판별
                    switch inequals[current - 1] {
                        case "<":
                            if result[current - 1] < i {
                                flag = true
                            }
                        case ">":
                            if result[current - 1] > i {
                                flag = true
                            }
                        default:
                            break
                    }
                }
                //중복을 허용하지 않으면서 부등호 조건에 맞는 수로 판별이 된 경우
                if flag {
                    //현재 위치에 해당 수를 저장하고,
                    result[current] = i
                    //사용했다는 표시를 한 후,
                    check[i] = true
                    //다음 위치로 재귀호출
                    getMaxInequal(current + 1)
                    //각 자리수 별로 재귀호출을 끝마친 후 다음 경우의 수를 위해 초기화
                    check[i] = false
                }
            }
        }
    }
}

//중복을 허용하지 않으면서 제시된 부등호 관계를 만족하는 수 중
//가장 작은 수를 구하는 함수
func getMinInequal(_ current: Int) -> Void {
    //최초로 완성된 수가 있으면 함수를 종료
    if printFlag {
        return
    }
    //기저조건(Base Condition)
    if current == k + 1 {
        //모든 재귀호출을 끝마친 후, 완성된 수를 출력 후
        for i in result {
            print(i, terminator: "")
        }
        //해당 수가 최소값이므로 최초로 완성됐다는 표시를 함
        printFlag = true
    } else {
        //각 자리수는 0~9 정수 이므로, 0부터 시작하여 처음으로 완성된 수가 조건에 맞는 최소값
        for i in 0...9 {
            //이미 존재하는 수일 경우 다음 수로 넘어감
            if !check[i] {
                //처음 값을 처리해주기 위한 변수
                var flag: Bool = false
                //첫 번째 위치에는 어떤 수가 와도 상관 없으므로 true 표시를 해줌
                if current == 0 {
                    flag = true
                } else {
                    // 그 다음 위치 부터는 부등호 조건에 맞는 수를 판별
                    switch inequals[current - 1] {
                    case "<":
                        if result[current - 1] < i {
                            flag = true
                        }
                    case ">":
                        if result[current - 1] > i {
                            flag = true
                        }
                    default:
                        break
                    }
                }
                //중복을 허용하지 않으면서 부등호 조건에 맞는 수로 판별이 된 경우
                if flag {
                    //현재 위치에 해당 수를 저장하고,
                    result[current] = i
                    //사용했다는 표시를 한 후,
                    check[i] = true
                    //다음 위치로 재귀호출
                    getMinInequal(current + 1)
                    //각 자리수 별로 재귀호출을 끝마친 후 다음 경우의 수를 위해 초기화
                    check[i] = false
                }
            }
        }
    }
}

getMaxInequal(0)
print()
//전역 변수이므로 초기화
printFlag = false
getMinInequal(0)
