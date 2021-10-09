//
//  main.swift
//  StringParsing
//
//  Created by 이영재 on 2021/10/09.
//MARK: - 알파벳 소문자가 연속되는 부분을 기준으로 문자열을 split하는 프로그램

//MARK: - input
let someString: String = readLine()!
var count: Int = 1  //연속되는 문자의 개수를 Counting
var markingCount: Int = 1 //연속되는 문자를 Marking, 가령 aabbbcdefggg인 경우 1122200003333, mississippi인 경우 00110220330, pizza인 경우 00110
var marked: Array<Character> = []

//MARK: - process
for i in 0..<someString.count - 1 {
    let current = someString[someString.index(someString.startIndex, offsetBy: i)]
    let next = someString[someString.index(someString.startIndex, offsetBy: i + 1)]
    
    //어쨌든 문자 1개는 무조건 나오므로 count를 1부터 시작하여
    //현재 문자와 바로 다음 문자가 같으면 count를 1씩 증가 시킴
    if current != next {
        //현재 문자와 바로 다음 문자가 다를 때, count가 1이라면 연속된 문자가 아니므로 0을 Marking함
        if count == 1 {
            marked.append("0");
        } else {
            //그게 아니라면 연속된 문자이므로 현재 MakringCount를 연속된 개수 만큼 Marking함
            for _ in 0..<count {
                let zero: Int = Int(exactly: ("0" as UnicodeScalar).value)!
                marked.append(Character(UnicodeScalar(zero + markingCount)!))
            }
            //현재 MakringCount는 사용을 완료했으므로 다음 연속된 문자를 마킹하기 위해 MarkingCount를 증가 시킴
            markingCount += 1
        }
        //문자의 연속이 끝났으므로 다음 문자의 개수를 파악하기 위해 1로 초기화함
        count = 1
    } else {
        count += 1  //연속된 문자이므로 개수 증가
    }
}

//위 반복문의 끝은 문자열의 마지막 전 문자 까지이므로 위 과정을 끝마치고 나서 count가 1이면
//마지막 문자는 연속된 문자가 아니므로 끝에 0을 Marking함
if (count == 1) {
    marked.append("0")
} else {
    //count가 1이 아니라면, 연속된 문자이므로, count개수 만큼 Marking함
    while count > 0 {
        let zero: Int = Int(exactly: ("0" as UnicodeScalar).value)!
        marked.append(Character(UnicodeScalar(zero + markingCount)!))
        count -= 1
    }
}

//MARK: - output

//print("[", terminator: "")
var check: Array<Bool> = Array(repeating: false, count: 110)
var temp: String = ""
for i in 0..<marked.count {
    //처음 원소가 연속적인 원소이면 "", 를 출력
    if i == 0 && marked[i] != "0" {
        temp += "\"\", "
        //처음 연속되는 곳을 기준으로 앞의 아무 문자가 없어 "", 를 출력 했으므로
        //처음 문자와 연속되는 다음 문자에서 ", "를 출력하지 않도록 하기 위해 표시
        check[Int("\(marked[i])")!] = true
    }
    //이미 출력을 마친 연속되는 구간은 출력하지 않고 한번도 출력을 하지 않은
    //연속되는 구간은 바로 전이 연속되는 구간인 경우는 아무것도 출력하지 않고,
    //그게 아니라면 ", "를 출력하고 넘어감
    if !check[Int("\(marked[i])")!] && marked[i] != "0" {
        if marked[i - 1] != "0" {
            temp += ""
        } else {
            temp += ", "
        }
        //", " 를 한번만 출력해주기 위해 표시
        check[Int("\(marked[i])")!] = true
        continue
    }
    //마지막 연속되는 원소 다음 문자가 없을 때 "" 값 처리
    if check[Int("\(marked[i])")!] {
        if i == marked.count - 1 {
            temp += "\"\""
        }
        continue
    }
    //연속되지 않은 구간은 출력
    temp += "\(someString[someString.index(someString.startIndex, offsetBy: i)])"
}

print("[\(temp)]")

