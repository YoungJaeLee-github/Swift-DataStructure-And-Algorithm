//
//  main.swift
//  RecursiveTriangle
//
//  Created by 이영재 on 2021/09/25.
//MARK: - 별 찍기(삼각형) 재귀호출

func getTriangle(_ height: Int, _ current: Int) -> Void {
    if height == 0 {
        return
    } else {
        for _ in 0..<height - 1 {
            print(" ", terminator: "")
        }
        for _ in 0..<2 * current + 1 {
            print("*", terminator: "")
        }
        print()
        getTriangle(height - 1, current + 1)
    }
}

let height: Int = Int(readLine()!)!
getTriangle(height, 0)
