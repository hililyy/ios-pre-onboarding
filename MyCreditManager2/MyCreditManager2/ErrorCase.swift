//
//  ErrorCase.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/05/10.
//

import Foundation

enum ErrorCase: Error, CustomStringConvertible {
    case wrongInputMenu
    case wrongInput
    case existStudent(name: String)
    case notExistStudent
    case notExistStudentDetail(name: String)
    case notExistGrade(name: String, subject: String)
    
    var description: String {
        switch self {
        case .wrongInputMenu:
            return MessageString.shared.wrongInputMenu
        case .wrongInput:
            return MessageString.shared.wrongInput
        case .existStudent(let name):
            return String(format: MessageString.shared.existStudent, name)
        case .notExistStudent:
            return MessageString.shared.notExistStudent
        case .notExistStudentDetail(let name):
            return String(format: MessageString.shared.notExistStudentDetail, name)
        case .notExistGrade(let name, let subject):
            return String(format: MessageString.shared.notExistGrade, name, subject)
        }
    }
}
