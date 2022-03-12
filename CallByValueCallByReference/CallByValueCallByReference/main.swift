//
//  main.swift
//  CallByValueCallByReference
//
//  Created by 이영재 on 2022/03/12.
//

//MARK: - Framework
import Foundation

//MARK: - Type
struct ValueType {
    //MARK: - Property
    var number: Int
    
    //MARK: - Initializer
    init(_ number: Int) {
        self.number = number
    }
}

class ReferenceType {
    //MARK: - Property
    var number: Int
    
    //MARK: - Initializer
    init(_ number: Int) {
        self.number = number
    }
}

//MARK: - Function
func callByValue(_ valueType: ValueType) -> Void {
    var newValueType: ValueType = valueType
    newValueType.number = 10
}

func callByReference(_ referenceType: ReferenceType) -> Void {
    var newReferenceType: ReferenceType = referenceType
    newReferenceType.number = 10
}

func solution() -> Void {
    var valueType: ValueType = ValueType(5)
    var referenceType: ReferenceType = ReferenceType(5)
    
    
    print("Before Call By Value : \(valueType.number)")
    print("Before Call By Reference : \(referenceType.number)")
    
    callByValue(valueType)
    callByReference(referenceType)
    
    print("Call By Value : \(valueType.number)")
    print("Call By Reference : \(referenceType.number)")
}
solution()
