//
//  main.swift
//  SaveMoney
//
//  Created by 이영재 on 2022/01/26.
//MARK: - 돈 모으기

//MARK: - Frameworks
import Foundation

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine() else { return }
    
    let M: Int = Int(input) ?? 0
    var money: Int = 1
    var saveMoney: Int = 0
    var day: Int = 0
    
    //MARK: - process
    while (saveMoney < M) {
        saveMoney += money
        money += 1
        day += 1
    }
    
    //MARK: - output
    print(day)
}
solution()

