//
//  main.swift
//  GraphByList
//
//  Created by 이영재 on 2022/04/14.
//MARK: - 그래프 구현 : 인접 리스트

//MARK: - Framework
import Foundation

//MARK: - Type
struct Graph {
    //MARK: - Property
    var edges: [Int]
    
    //MARK: - Initializer
    init() {
        self.edges = []
    }
}

//MARK: - Function
func isConnected(_ myGraph: [Graph], _ x: Int, _ y: Int) -> Bool {
    //Time Complexity : O(dgree(x))
    var result: Bool = false
    
    for i in 0..<myGraph[x].edges.count {
        if myGraph[x].edges[i] == y {
            result = true
            break
        }
    }
    
    return result
}

func getNodeList(_ myGraph: [Graph], _ x: Int) -> Void {
    //Time Complexity : O(dgree(x))
    var answer: String = ""
    
    for i in 0..<myGraph[x].edges.count - 1 {
        answer += "\(myGraph[x].edges[i]) "
    }
    answer += "\(myGraph[x].edges[myGraph[x].edges.count - 1])"
    
    print(answer)
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var myGraph: [Graph] = Array(repeating: Graph(), count: n + 10)
    
    //MARK: - Process
    for _ in 0..<m {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        
        myGraph[a].edges.append(b)
        myGraph[b].edges.append(a)
    }
    
    //MARK: - Output
    print(isConnected(myGraph, 1, 2))   //true
    print(isConnected(myGraph, 1, 3))   //true
    print(isConnected(myGraph, 1, 4))   //true
    print(isConnected(myGraph, 1, 5))   //false
    
    getNodeList(myGraph, 5) //3 4
}
solution()
