//
//  main.swift
//  CircularQueue
//
//  Created by 이영재 on 2022/04/03.
//MARK: - 원형큐 구현하기

//MARK: - Framework
import Foundation

//MARK: - Type
struct Queue {
    //MARK: - Property
    var array: [Int]
    var f: Int
    var r: Int
    var count: Int
    var capacity: Int
    
    //MARK: - Initialzier
    init(_ capacity: Int) {
        self.capacity = capacity
        self.f = 0
        self.r = 0
        self.count = 0
        self.array = Array(repeating: 0, count: capacity)
    }
    
    //MARK: - Method
    mutating func push(_ data: Int) -> Void {
        if self.count >= self.capacity {
            print("Overflow")
        } else {
            self.array[self.r] = data
            self.r += 1
            self.count += 1
            
            self.r = self.r >= self.capacity ? 0 : self.r
        }
    }
    
    mutating func pop() -> Void {
        if self.count <= 0 {
            print("Overflow")
        } else {
            self.array[self.f] = 0
            self.f += 1
            self.count -= 1
            
            self.f = self.f >= self.capacity ? 0 : self.f
        }
    }
    
    func front() -> Int {
        return self.count <= 0 ? -1 : self.array[self.f]
    }
    
    func size() -> Int {
        return self.count
    }
}

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var queue: Queue = Queue(n)
    
    //MARK: - Process & Output
    for _ in 0..<m {
        guard let inputData = readLine()?.components(separatedBy: " ") else { return }
        let operation: Int = inputData.map { Int($0) }[0] ?? 0
        
        switch operation {
        case 1:
            let data: Int = inputData.map { Int($0) }[1] ?? 0
            queue.push(data)
        case 2:
            queue.pop()
        case 3:
            print(queue.front() == -1 ? "NULL" : "\(queue.front())")
        default:
            break
        }
    }
}
solution()
