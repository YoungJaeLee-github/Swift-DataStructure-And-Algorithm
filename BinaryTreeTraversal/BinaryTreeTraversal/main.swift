//
//  main.swift
//  BinaryTreeTraversal
//
//  Created by 이영재 on 2022/04/06.
//MARK: - 이진트리 순회

//MARK: - Framework
import Foundation

//MARK: - Type
struct Node {
    //MARK: - Property
    var left: Int
    var right: Int
    
    //MARK: - Initializer
    init(_ left: Int, _ right: Int) {
        self.left = left
        self.right = right
    }
}

//MARK: - Function
func preOrder(_ tree: [Node], _ root: Int) -> Void {
    if root == -1 {
        return
    }
    
    print("\(root) ", terminator: "")
    preOrder(tree, tree[root].left)
    preOrder(tree, tree[root].right)
}

func inOrder(_ tree: [Node], _ root: Int) -> Void {
    if root == -1 {
        return
    }
    
    inOrder(tree, tree[root].left)
    print("\(root) ", terminator: "")
    inOrder(tree, tree[root].right)
}

func postOrder(_ tree: [Node], _ root: Int) -> Void {
    if root == -1 {
        return
    }
    
    postOrder(tree, tree[root].left)
    postOrder(tree, tree[root].right)
    print("\(root) ", terminator: "")
}

func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    
    var tree: [Node] = Array(repeating: Node(0, 0), count: n)
    let root: Int = 0
    
    for _ in 0..<n {
        guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = input.map { Int($0) }[0] ?? 0
        let b: Int = input.map { Int($0) }[1] ?? 0
        let c: Int = input.map { Int($0) }[2] ?? 0
        
        tree[a].left = b
        tree[a].right = c
    }
    
    //MARK: - Process & Output
    preOrder(tree, root)
    print()
    
    inOrder(tree, root)
    print()
    
    postOrder(tree, root)
}
solution()
