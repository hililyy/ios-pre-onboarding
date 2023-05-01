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
        addGrade()
    case .deleteGrade:
        deleteGrade()
    case .showScore:
        showScore()
    case .exit:
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

func addGrade() {
    print(MessageString.shared.addGrade)
    guard let gradeInfo = readLine() else { return }
    let gradeInfoArr = gradeInfo.components(separatedBy: " ")
    
    switch gradeInfoArr.count {
    case 3:
        if let _ = student[gradeInfoArr.first!] {
            if let index = student[gradeInfoArr.first!]?.firstIndex(where: { $0.subject == gradeInfoArr[1] }) {
                student[gradeInfoArr.first!]?[index] = Grade(subject: gradeInfoArr[1], grade: gradeInfoArr[2])
            } else {
                student[gradeInfoArr.first!]?.append(Grade(subject: gradeInfoArr[1], grade: gradeInfoArr[2]))
            }
            print("\(gradeInfoArr[0]) 학생의 \(gradeInfoArr[1]) 과목이 \(gradeInfoArr[2])로 추가(변경)되었습니다.")
        } else {
            print(MessageString.shared.notExistStudent)
        }
    default:
        print(MessageString.shared.inputError)
    }
}

func deleteGrade() {
    print(MessageString.shared.deleteGrade)
    guard let gradeInfo = readLine() else { return }
    let gradeInfoArr = gradeInfo.components(separatedBy: " ")
    
    switch gradeInfoArr.count {
    case 2:
        if let _ = student[gradeInfoArr.first!] {
            if let index = student[gradeInfoArr.first!]?.firstIndex(where: { $0.subject == gradeInfoArr[1] }) {
                student[gradeInfoArr.first!]?.remove(at: index)
                print("\(gradeInfoArr[0]) 학생의 \(gradeInfoArr[1]) 과목의 성적이 삭제되었습니다.")
            } else {
                print("\(gradeInfoArr[0]) 학생의 \(gradeInfoArr[1]) 과목의 성적이 존재하지 않습니다.")
            }
        } else {
            print(MessageString.shared.notExistStudent)
        }
    default:
        print(MessageString.shared.inputError)
    }
}

func showScore() {
    print(MessageString.shared.showScore)
    guard let studentName = readLine() else { return }
    
    if studentName != "" {
        if let scores = student[studentName] {
            
            for score in scores {
                print("\(score.subject): \(score.grade)")
            }
            let average: Double = (student[studentName]?
                .map { Double($0.grade) ?? 0 }
                .reduce(0, +) ?? 0) / Double(scores.count)
            
            print("평점: \(average)")
        } else {
            print("\(studentName) 학생을 찾지 못했습니다.")
        }
    } else {
        print(MessageString.shared.inputError)
    }
}
          
          let array = [1, 2, 3, 4, 5]
          let sum = array.reduce(0, +) // 배열의 합 계산
          let count = array.count // 배열의 요소 개수
          let average = Double(sum) / Double(count) // 평균 계산

while(true) {
    showMenu()
    selectMenu()
}
