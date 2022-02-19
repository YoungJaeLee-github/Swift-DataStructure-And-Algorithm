//
//  main.swift
//  Tetris
//
//  Created by 이영재 on 2022/02/19.
//MARK: - Tetris

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct Tetris {
    var C: Int
    var R: Int
    var X: Int
    var Y: Int
    var data: Array<Array<Int>>
    
    //MARK: - Initializer
    init(_ C: Int, _ R: Int) {
        self.C = C
        self.R = R
        self.X = 0
        self.Y = 0
        self.data = []
    }
}
//MARK: - Functions
func getCompleteCount(_ data: Array<Array<Int>>, _ bottom: Int, _ R: Int, _ C: Int, _ currentX: Int) -> Int {
    var result: Int = 0
    var tempTetris: Array<Array<Int>> = []
    
    for datum in data {
        tempTetris.append(datum)
    }

    for i in stride(from: bottom, to: bottom - 4, by: -1) {
        tempTetris[i][currentX] = 1
    }

    for i in 0..<R {
        var numberOneCount: Int = 0
        for j in 0..<C {
            numberOneCount += tempTetris[i][j] == 1 ? 1 : 0
        }
        result += numberOneCount == C ? 1 : 0
    }
    
    return result
}

func solution() -> Void {
    //MARK: - input
    guard let inputMapSize = readLine()?.components(separatedBy: " ") else { return }
    let C: Int = inputMapSize.map { Int($0) ?? 0 }[0]
    let R: Int = inputMapSize.map { Int($0) ?? 0 }[1]
    
    var tetris: Tetris = Tetris(C, R)
    var candidateX: Array<Int> = []
    var candidateY: Array<Int> = Array(repeating: 0, count: C)
    
    for _ in 0..<tetris.R {
        guard let inputTetrisData = readLine()?.components(separatedBy: " ") else { return }
        tetris.data.append(inputTetrisData.map { Int($0) ?? 0 })
    }
    
    //MARK: - process
    for i in 0..<C {
        var zeroCount: Int = 0
        for j in 0..<R {
            if tetris.data[j][i] == 1 {
                break
            }
            zeroCount += 1
        }
        if zeroCount >= 4 {
            candidateX.append(i)
        }
    }
    
    if candidateX.count == 0 {
        tetris.X = 0
        tetris.Y = 0
    } else {
        for x in candidateX {
            var bottom: Int = 3
            
            for i in bottom..<R {
                if tetris.data[i][x] == 0 {
                    bottom = i
                } else {
                    break
                }
            }
            
            candidateY[x] = getCompleteCount(tetris.data, bottom, tetris.R, tetris.C, x)
        }
        
        for i in 0..<C {
            if candidateY[i] == 0 {
                continue
            }
            
            if tetris.Y < candidateY[i] {
                tetris.Y = candidateY[i]
                tetris.X = i
            }
        }
    }
    
    //MARK: - output
    print("\(tetris.X + 1) \(tetris.Y)")
}
solution()
