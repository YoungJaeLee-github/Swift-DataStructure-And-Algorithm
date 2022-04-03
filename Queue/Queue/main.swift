//
//  main.swift
//  Queue
//
//  Created by 이영재 on 2022/04/03.
//MARK: - 큐 구현하기

//MARK: - Framework
import Foundation

//MARK: - Type
struct Queue {
    //MARK: - Property
    private var array: [Int]
    private var f: Int
    private var r: Int
    private var capacity: Int
    
    //MARK: - Initializer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.array = Array(repeating: 0, count: capacity)
        self.f = 0
        self.r = 0
    }
    
    //MARK: - Method
    mutating func push(_ data: Int) -> Void {
        if self.r >= self.capacity {
            print("Overflow")
        } else {
            self.array[self.r] = data
            self.r += 1
        }
    }
    
    mutating func pop() -> Void {
        if self.r - self.f <= 0 {
            print("Underflow")
        } else {
            self.array[self.f] = 0
            self.f += 1
        }
    }
    
    func front() -> Int {
        return self.r - self.f <= 0 ? -1 : self.array[self.f]
    }
    
    func size() -> Int {
        return self.r - self.f
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
