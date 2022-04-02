//
//  main.swift
//  Stack
//
//  Created by 이영재 on 2022/04/02.
//MARK: - 스택 구현하기

//MARK: - Framework
import Foundation

//MARK: - Type
struct Stack {
    //MARK: - Property
    var array: [Int]
    var len: Int
    var capacity: Int
    
    //MARK: - Initializer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.array = Array(repeating: 0, count: capacity)
        self.len = 0
    }
    
    //MARK: - Method
    mutating func push(_ data: Int) -> Void {
        if len >= capacity {
            print("Overflow")
        } else {
            self.array[self.len] = data
            self.len += 1
        }
    }
    
    mutating func pop() -> Void {
        if self.len <= 0 {
            print("Underflow")
        } else {
            self.array[self.len - 1] = 0
            self.len -= 1
        }
    }
    
    func top() -> Int {
        return self.len <= 0 ? -1 : self.array[len - 1]
    }
}

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var stack: Stack = Stack(n)
    
    //MARK: - Process & Output
    for _ in 0..<m {
        guard let data = readLine()?.components(separatedBy: " ") else { return }
        let operation: Int = data.map { Int($0) }[0] ?? 0
        
        switch operation {
        case 1:
            let number: Int = data.map { Int($0) }[1] ?? 0
            stack.push(number)
        case 2:
            stack.pop()
        case 3:
            print(stack.top() == -1 ? "NULL" : "\(stack.top())")
        default:
            break
        }
    }
}
solution()
