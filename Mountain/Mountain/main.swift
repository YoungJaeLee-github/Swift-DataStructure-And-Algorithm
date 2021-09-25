//
//  main.swift
//  Mountain
//
//  Created by 이영재 on 2021/09/25.
//MARK: - Mountaion(Recursive Function)

func getMountain(_ number: Int) -> String {
    let current: Int = number
    if current == 1 {
        return "1"
    } else {
        return getMountain(current - 1) + "\(current)" + getMountain(current - 1)
    }
}

let number: Int = Int(readLine()!)!

print(getMountain(number))
