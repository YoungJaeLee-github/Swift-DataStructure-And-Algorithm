//
//  main.swift
//  PriorityQueue
//
//  Created by 이영재 on 2021/12/01.
//MARK: - Heap을 이용한 PriorityQueue(우선순위 큐) 구현

//MARK: - Types
struct PriorityQueue {
    //MARK: - Properties
    var data: Array<Int> = []
    
    //MARK: - Methods
    mutating func push(_ element: Int) -> Void {
        self.data.append(element)
        var idx: Int = data.count - 1
        
        while idx > 0 {
            if self.data[idx] < self.data[idx >> 1] {
                let temp: Int = self.data[idx]
                self.data[idx] = self.data[idx >> 1]
                self.data[idx >> 1] = temp
                
                idx >>= 1
            } else {
                break
            }
        }
    }
    
    mutating func pop() -> Void {
        self.data[0] = self.data[self.data.count - 1]
        self.data.remove(at: self.data.count - 1)
        
        var idx: Int = 0
        
        while true {
            var childIdx: Int = 0
            if self.data.count <= idx << 1 {
                break
            } else if (0 <= idx << 1 && idx << 1 <= self.data.count) && self.data.count <= idx << 1 + 1 {
                childIdx = idx << 1
            } else {
                childIdx = self.data[idx << 1] < self.data[idx << 1 + 1] ? idx << 1 : idx << 1 + 1
            }
            
            if self.data[idx] > self.data[childIdx] {
                let temp: Int = self.data[idx]
                self.data[idx] = self.data[childIdx]
                self.data[childIdx] = temp
                idx = childIdx
            } else {
                break
            }
        }
    }
    
    func top() -> Int {
        return data[0]
    }
}

//MARK: - Input
var priorityQueue: PriorityQueue = PriorityQueue()

priorityQueue.push(3)
priorityQueue.push(1)
priorityQueue.push(2)
priorityQueue.push(-1)
priorityQueue.push(5)
priorityQueue.push(10)
priorityQueue.push(100)
priorityQueue.push(2000)

//MARK: - Output
print(priorityQueue.top())
priorityQueue.pop()

print(priorityQueue.top())
priorityQueue.pop()

print(priorityQueue.top())
priorityQueue.pop()

print(priorityQueue.top())
priorityQueue.pop()

print(priorityQueue.top())
priorityQueue.pop()

print(priorityQueue.top())
priorityQueue.pop()

print(priorityQueue.top())
priorityQueue.pop()

print(priorityQueue.top())
priorityQueue.pop()
