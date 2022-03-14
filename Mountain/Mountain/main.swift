//
//  main.swift
//  Mountain
//
//  Created by 이영재 on 2021/09/25.
//MARK: - Mountaion(Recursive Function)

//MARK: - Function
func getMountain(_ number: Int) -> String {
    if number == 1 {
        return "1"
    } else {
        let temp: String = getMountain(number - 1)
        return temp + "\(number)" + temp
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let number: Int = Int(readLine() ?? "0") else { return }
    var moutain: String = ""
    
    //MARK: - Process
    moutain = getMountain(number)
    
    //MARK: - Output
    print(moutain)
}
solution()
