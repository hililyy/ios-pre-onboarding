//
//  main.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/04/30.
//

import Foundation

var student: [String: [Grade]] = [:]

func showMenu() {
    print(MessageString.shared.menu)
}

func selectMenu() {
    let selectedNum = ProgramMenu(rawValue: readLine() ?? "")
    
    switch selectedNum {
    case .addStudent:
        addStudent()
    case .deleteStudent:
        deleteStudent()
    case .addGrade:
        print("3")
    case .deleteGrade:
        print("4")
    case .showScore:
        print("5")
    case .exit:
        print("X")
        exit(0)
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

func addStudent() {
    print(MessageString.shared.addStudent)
    guard let studentName = readLine() else { return }
    
    if studentName != "" {
        if let _ = student[studentName] {
            print("\(studentName) 학생은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            student[studentName] = []
            print("\(studentName) 학생을 추가했습니다.")
        }
    } else {
        print(MessageString.shared.inputError)
    }
}

func deleteStudent() {
    print(MessageString.shared.deleteStudet)
    guard let studentName = readLine() else { return }
    
    if studentName != "" {
        if let _ = student[studentName] {
            student[studentName] = nil
            print("\(studentName) 학생을 삭제하였습니다.")
        } else {
            print("\(studentName) 학생을 찾지 못했습니다.")
        }
    } else {
        print(MessageString.shared.inputError)
    }
    
}

while(true) {
    showMenu()
    selectMenu()
}
