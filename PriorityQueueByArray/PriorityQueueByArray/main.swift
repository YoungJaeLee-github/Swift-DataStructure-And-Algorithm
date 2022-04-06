//
//  main.swift
//  PriorityQueueByArray
//
//  Created by 이영재 on 2022/04/06.
//MARK: - 우선순위 큐(배열)

//MARK: - Framework
import Foundation

//MARK: - Type
struct PriorityQueue {
    //MARK: - Property
    private var data: [Int]
    private var len, capacity: Int
    
    //MARK: - Initiailzer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.data = Array(repeating: 0, count: capacity + 10)
        self.len = 0
    }
    
    //MARK: - Method
    mutating func push(_ x: Int) -> Void {
        self.data[self.len] = x
        self.len += 1
    }
    
    mutating func pop() -> Void {
        var min: Int = self.data[0], minIndex: Int = 0
        for i in 0..<self.len {
            if min > self.data[i] {
                min = self.data[i]
                minIndex = i
            }
        }
        
        for i in minIndex..<self.len {
            self.data[i] = self.data[i + 1]
        }
        
        self.len -= 1
    }
    
    func top() -> Int {
        var min: Int = self.data[0]
        for i in 0..<self.len {
            min = min > self.data[i] ? self.data[i] : min
        }
        
        return min
    }
}

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var pq: PriorityQueue = PriorityQueue(n)
    
    //MARK: - Process & Output
    pq.push(5)
    pq.push(1)
    pq.push(7)
    pq.push(2)
    pq.push(1)
    
    print(pq.top()) // 1
    pq.pop()
    
    print(pq.top()) // 1
    pq.pop()
    
    print(pq.top()) // 2
    pq.pop()
    
    print(pq.top()) // 5
    pq.pop()
    
    print(pq.top()) // 7
    
}
solution()
