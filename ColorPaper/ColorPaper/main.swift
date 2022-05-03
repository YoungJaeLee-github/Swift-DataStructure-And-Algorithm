//
//  main.swift
//  ColorPaper
//
//  Created by 이영재 on 2022/01/28.
//MARK: - colorpaper

//MARK: - Frameworks
import Foundation

//MARK: - Types
struct ColorPaperInfo {
    //MARK: - Properties
    var row: Int
    var column: Int
    var width: Int
    var height: Int

    //MARK: - Initializer
    init(_ row: Int, _ column: Int, _ width: Int, _ height: Int) {
        self.row = row
        self.column = column
        self.width = width
        self.height = height
    }
}

struct AreaInfo {
    //MARK: - Properties
    var paperInfo: Array<ColorPaperInfo>
    var paperCount: Int
    var maxRow: Int
    var maxColumn: Int
    var array: Array<Array<Int>>
    var area: Array<Int>

    //MARK: - Initializer
    init(_ paperInfo: Array<ColorPaperInfo>, _ paperCount: Int) {
        self.paperInfo = paperInfo
        self.paperCount = paperCount
        self.maxRow = 110
        self.maxColumn = 110
        self.array = Array(repeating: Array(repeating: 0, count: maxColumn), count: maxRow)
        self.area = Array(repeating: 0, count: paperCount + 10)
    }
}

//MARK: - Functions
func solution() -> Void {
    //MARK: - input
    var answer: String = ""
    guard let paperCount: Int = Int(readLine() ?? "0") else { return }
    var paperInfo: Array<ColorPaperInfo> = []
    for _ in 0..<paperCount {
        guard let input = readLine()?.components(separatedBy: " ") else { return }
        let column: Int = input.map { Int($0) }[0] ?? 0
        let row: Int = input.map { Int($0) }[1] ?? 0
        let width: Int = input.map { Int($0) }[2] ?? 0
        let height: Int = input.map { Int($0) }[3] ?? 0

        paperInfo.append(ColorPaperInfo(row, column, width, height))
    }
    var areaInfo: AreaInfo = AreaInfo(paperInfo, paperCount)

    //MARK: - process
    for i in 1...paperCount {
        for j in paperInfo[i - 1].row..<paperInfo[i - 1].row + paperInfo[i - 1].height {
            for k in paperInfo[i - 1].column..<paperInfo[i - 1].column + paperInfo[i - 1].width {
                areaInfo.array[j][k] = i
            }
        }
    }

    for i in 0..<areaInfo.array.count {
        for j in 0..<areaInfo.array[i].count {
            areaInfo.area[areaInfo.array[i][j]] += 1
        }
    }

    for paperArea in areaInfo.area {
        if paperArea == 0 {
            continue
        }
        answer += "\(paperArea)\n"
    }

    //MARK: - output
    print(answer)
}
solution()
