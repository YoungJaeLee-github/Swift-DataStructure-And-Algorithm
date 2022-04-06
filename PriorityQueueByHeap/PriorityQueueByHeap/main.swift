//
//  main.swift
//  PriorityQueueByHeap
//
//  Created by 이영재 on 2022/04/06.
//MARK: - 우선순위 큐(힙)

//MARK: - Framework
import Foundation

//MARK: - Type
struct PriorityQueue {
    //MARK: - Property
    var data: [Int]
    var len, capacity: Int
    
    //MARK: - Initializer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.data = Array(repeating: 0, count: self.capacity + 10)
        self.len = 1
    }
    
    //MARK: - Method
    mutating func push(_ x: Int) -> Void {
        self.data[self.len] = x
        self.len += 1
        
        var currentIndex: Int = self.len - 1
        while currentIndex > 1 {
            if self.data[currentIndex] < self.data[currentIndex >> 1] {
                let temp: Int = self.data[currentIndex]
                self.data[currentIndex] = self.data[currentIndex >> 1]
                self.data[currentIndex >> 1] = temp
                
                currentIndex >>= 1
            } else {
                break
            }
        }
    }
    
    mutating func pop() -> Void {
        self.data[1] = self.data[self.len - 1]
        self.data[self.len - 1] = 0
        self.len -= 1
        
        var currentIndex: Int = 1
        while true {
            var childIndex: Int = -1
            
            if self.len - 1 < (currentIndex << 1) {
                break
            } else if (0 < (currentIndex << 1) && (currentIndex << 1) <= self.len - 1) && (currentIndex << 1 + 1) > self.len - 1 {
                childIndex = currentIndex << 1
            } else {
                childIndex = (currentIndex << 1) < (currentIndex << 1 + 1) ? (currentIndex << 1) : (currentIndex << 1 + 1)
            }
            
            if self.data[currentIndex] > self.data[childIndex] {
                let temp: Int = self.data[currentIndex]
                self.data[currentIndex] = self.data[childIndex]
                self.data[childIndex] = temp
                
                currentIndex = childIndex
            } else {
                break
            }
        }
    }
    
    func top() -> Int {
        return self.data[1]
    }
}

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var pq: PriorityQueue = PriorityQueue(n)
    
    //MARK: - Process & Output
    pq.push(5)
    pq.push(8)
    pq.push(1)
    pq.push(3)
    pq.push(3)
    
    print(pq.top()) // 1
    pq.pop()
    
    print(pq.top()) // 3
    pq.pop()
    
    print(pq.top()) // 3
    pq.pop()
    
    print(pq.top()) // 5
    pq.pop()
    
    print(pq.top()) // 8
}
solution()
