//
//  main.swift
//  Seat
//
//  Created by 이영재 on 2022/02/20.
//MARK: - seat

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct Seat {
    //MARK: - Properties
    var R: Int  //좌석의 가로크기
    var C: Int  //좌석의 세로크기
    var array: Array<Array<Bool>>   //공연장 좌석
    
    //MARK: - Initializer
    init(_ R: Int, _ C: Int) {
        self.R = R
        self.C = C
        self.array = Array(repeating: Array(repeating: false, count: self.C + 10), count: self.R + 10)
    }
}

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    guard let input = readLine()?.components(separatedBy: " ") else { return }
    guard let K = Int(readLine() ?? "0") else { return }
    let R = input.map { Int($0) }[0] ?? 0
    let C = input.map { Int($0) }[1] ?? 0
    
    var seat: Seat = Seat(R, C)
    var seatX: Int = 1
    var seatY: Int = seat.C
    
    for i in 0...(seat.R + 1) {
        seat.array[0][i] = true
        seat.array[seat.C + 1][i] = true
    }
    
    for i in 1...seat.C {
        seat.array[i][0] = true
        seat.array[i][seat.R + 1] = true
    }
    
    //MARK: - process
    if K > seat.R * seat.C {
        print(0)
    } else {
        var x: Int = 1
        var y: Int = seat.C
        var seatCount: Int = 1
        
        while seatCount < K {
            //위
            for i in stride(from: y, through: 1, by: -1) {
                if seatCount >= K {
                    break
                }
                
                if !seat.array[i - 1][x] {
                    seat.array[i][x] = true
                    seatCount += 1
                    seatY -= 1
                } else {
                    y = i
                    break
                }
            }
            if seatCount >= K {
                break
            }
            
            //오른쪽
            for i in x...seat.R {
                if seatCount >= K {
                    break
                }
                
                if !seat.array[y][i + 1] {
                    seat.array[y][i] = true
                    seatCount += 1
                    seatX += 1
                } else {
                    x = i
                    break
                }
            }
            if seatCount >= K {
                break
            }
            
            //아래
            for i in y...seat.C {
                if seatCount >= K {
                    break
                }
                
                if !seat.array[i + 1][x] {
                    seat.array[i][x] = true
                    seatCount += 1
                    seatY += 1
                } else {
                    y = i
                    break
                }
            }
            if seatCount >= K {
                break
            }
            
            //왼쪽
            for i in stride(from: x, through: 1, by: -1) {
                if seatCount >= K {
                    break
                }
                
                if !seat.array[y][i - 1] {
                    seat.array[y][i] = true
                    seatCount += 1
                    seatX -= 1
                } else {
                    x = i
                    break
                }
            }
            if seatCount >= K {
                break
            }
        }
        
        //MARK: - output
        print("\(seatX) \((seat.C - seatY + 1))")
    }
}
solution()

