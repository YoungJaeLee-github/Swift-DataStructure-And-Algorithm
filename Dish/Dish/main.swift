//
//  main.swift
//  Dish
//
//  Created by 이영재 on 2022/04/02.
//MARK: - 접시

//MARK: - Framework
import Foundation

//MARK: - Type
struct Stack {
    //MARK: - Property
    private var array: [Character]
    private var len: Int
    private var capacity: Int
    
    //MARK: - Initializer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.array = Array(repeating: " ", count: capacity + 10)
        self.len = 0
    }
    
    //MARK: - Method
    mutating func push(_ data: Character) -> Void {
        if self.len < self.capacity {
            self.array[self.len] = data
            self.len += 1
        }
    }
    
    mutating func pop() -> Void {
        if self.len > 0 {
            self.array[self.len - 1] = " "
            self.len -= 1
        }
    }
    
    func top() -> Character {
        return self.len <= 0 ? " " : self.array[self.len - 1]
    }
    
    func size() -> Int {
        return len
    }
}

//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let str: String = readLine() else { return }
    
    let alphaCount: Int = 26
    var answer: String = ""
    var candidateString: String = ""
    var flag: Bool = false
    var check: [Bool] = Array(repeating: false, count: alphaCount + 10)
    var stack: Stack = Stack(alphaCount)
    
    //MARK: - Process
    for char in str {
        for j in 0..<alphaCount {
            let alpha: Character = Character(UnicodeScalar(97 + j)!)
            
            if char >= alpha {
                if !check[j] {
                    check[j] = true
                    stack.push(alpha)
                    answer += "push\n"
                }
            } else {
                break
            }
        }
        
        while stack.size() > 0 {
            candidateString += "\(stack.top())"
            stack.pop()
            answer += "pop\n"
        }
    }
    
    for i in 0..<candidateString.count {
        if candidateString[candidateString.index(candidateString.startIndex, offsetBy: i)] != str[str.index(str.startIndex, offsetBy: i)] {
            flag = true
            break
        }
    }
    answer = flag ? "impossible" : answer
    
    //MARK: - Output
    print(answer)
}
solution()
