//
//  ErrorCase.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/05/10.
//

import Foundation

enum ErrorCase: Error, CustomStringConvertible {
    case wrongInput
    case existStudent(name: String)
    case notExistStudent
    case notExistStudentDetail(name: String)
    
    var description: String {
        switch self {
        case .wrongInput:
            return MessageString.shared.wrongInput
        case .existStudent(let name):
            return String(format: MessageString.shared.existStudent, name)
        case .notExistStudent:
            return MessageString.shared.notExistStudent
        case .notExistStudentDetail(let name):
            return String(format: MessageString.shared.notExistStudentDetail, name)
        }
    }
}
