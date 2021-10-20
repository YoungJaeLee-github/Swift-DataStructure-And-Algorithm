//
//  main.swift
//  GoodSeq
//
//  Created by 이영재 on 2021/10/20.
//MARK: - goodSeq

//MARK: - Values
var N: Int
var result: Array<Int> = []
var isFinished: Bool = false

//MARK: - function
func isPossible(_ x: Int, _ length: Int) -> Bool {
    //앞의 숫자들은 전부 좋은 수열의 조건을 만족하면서 등록을 진행하므로, 하나라도 다른 숫자가 있으면 true 반환
    for i in 0..<length {
        if result[x - i] != result[x - i - length] {
            return true
        }
    }
    
    return false
}

//x번째 숫자를 결정하고, 인접한 length길이의 수열이 중복되지 않는지 검사 후
//x + 1번째 숫자를 등록하는 함수
//즉, x ~ n-1번 째 까지 숫자를 결정하는 함수(1, 2, 3으로 이루어진 수열)
func getGoodSeq(_ x: Int, _ N: Int) -> Void {
    if isFinished {
        return
    }
    
    //Base Condition
    if (x >= N) {
        for i in result {
            print(i, terminator: "")
        }
        print()
        isFinished = true
        return
    }
    
    for i in 1...3 {
        result[x] = i
        var flag: Bool = false
        
        if (x != 0) {
            for j in 1...(x + 1) / 2 {
                if !isPossible(x, j) {
                    flag = true
                    break
                }
            }
        }
        
        if !flag {
            getGoodSeq(x + 1, N)
        }
    }
}

//MARK: - input
N = Int(readLine()!)!
result = Array(repeating: 0, count: N)


//MARK: - process & output
getGoodSeq(0, N)

