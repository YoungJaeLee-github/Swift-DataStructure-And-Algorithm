//
//  main.swift
//  SquareSum
//
//  Created by 이영재 on 2022/04/08.
//MARK: - 직사각형의 합

//MARK: - Framework
import Foundation

//MARK: - Function
func getPrefixSum(_ squareSum: inout [[Int]], _ N: Int, _ M: Int) -> Void {
    for i in 1...N {
        for j in 1...M {
            squareSum[i][j] += squareSum[i - 1][j] + squareSum[i][j - 1] - squareSum[i - 1][j - 1]
        }
    }
}

func getSquareSum(_ squareSum: [[Int]], _ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int {
    return squareSum[c + 1][d + 1] - squareSum[c + 1][b] - squareSum[a][d + 1] + squareSum[a][b]
}

func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    var Q: Int = input.map { Int($0) }[2] ?? 0
    var squareSum: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 10), count: N + 10)
    
    for i in 1...N {
        guard let inputData = readLine()?.components(separatedBy: " ") else { return }
        for j in 1...M {
            squareSum[i][j] = inputData.map { Int($0) ?? 0 }[j - 1]
        }
    }
    
    //MARK: - Process & Output
    getPrefixSum(&squareSum, N, M)
    
    while Q > 0 {
        guard let inputData = readLine()?.components(separatedBy: " ") else { return }
        let a, b, c, d: Int
        a = inputData.map { Int($0) }[0] ?? 0
        b = inputData.map { Int($0) }[1] ?? 0
        c = inputData.map { Int($0) }[2] ?? 0
        d = inputData.map { Int($0) }[3] ?? 0
        
        //1. 부분 문제를 정의한다.
        //N * M의 정수가 들어있는 사각형이 주어지며, 그 중(a, b)부터 (c, d)까지의 넓이를 구함
        //먼저 (a, b)부터 (c, d)의 넓이를 구하려면 (0, 0) 부터 (c, d)까지의 넓이에서 (0, 0)부터 (c, b - 1) 까지의 넓이와, (a - 1, d) 까지의 넓이를 빼고 겹치는 (a - 1, b - 1) 까지의 넓이를 더해줌으로 써 구할 수 있으므로,
        //각 위치 까지의 사각형 넓이를 미리 구해놔야 함
        
        //2. 점화식을 세움
        //각 위치까지의 사각형 넓이 T[i][j] = T[i - 1][j] + T[i][j - 1] - T[i - 1][j - 1] + T[i][j]
        //구하고자 하는 구간(a, b) ~ (c, d)의 넓이 = T[c][d] - T[c][b - 1] - T[a - 1][d] + T[a - 1][b - 1]
        print(getSquareSum(squareSum, a, b, c, d))
        Q -= 1
    }
}
solution()
