//
//  main.swift
//  AverageAndMode
//
//  Created by 이영재 on 2022/01/28.
//MARK: - 대푯값

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct AverageAndModeInfo {
    //MARK: - Properties
    let numberCount: Int = 10
    var average: Int
    var mode: Int
    var numbers: Array<Int>
    var frequency: Array<Int>
    
    //MARK: - Initializer
    init(_ average: Int, _ mode: Int) {
        self.average = average
        self.mode = mode
        self.numbers = Array(repeating: 0, count: numberCount + 10)
        self.frequency = Array(repeating: 0, count: 1010)
    }
}

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    var sum: Int = 0
    var averageAndMode: AverageAndModeInfo = AverageAndModeInfo(0, 0)
    
    //MARK: - process
    for i in 1...averageAndMode.numberCount {
        guard let number: Int = Int(readLine() ?? "0") else { return }
        averageAndMode.numbers[i] = number
        averageAndMode.frequency[averageAndMode.numbers[i]] += 1
        sum += number
    }
    averageAndMode.average = sum / averageAndMode.numberCount
    
    for i in averageAndMode.frequency {
        if i == 0 {
            continue
        }
        print(i)
    }
    
    for i in 10..<averageAndMode.frequency.count {
        if averageAndMode.frequency[i] == 0 {
            continue
        }
        averageAndMode.mode = averageAndMode.frequency[averageAndMode.mode] < averageAndMode.frequency[i] ? i : averageAndMode.mode
    }
    
    //MARK: - output
    print(averageAndMode.average, averageAndMode.mode, separator: "\n")
}
solution()
