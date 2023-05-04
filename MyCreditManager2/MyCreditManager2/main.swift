//
//  main.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/04/30.
//

import Foundation

var student: [String: [Grade]] = [:]

func showMenu() {
    print(MessageString.shared.menuDescription)
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
        print(MessageString.shared.menuError)
    }
}

func addStudent() {
    print(MessageString.shared.addStudentDescription)
    guard let studentName = readLine() else { return }
    
    if studentName != "" {
        if let _ = student[studentName] {
            print(String(format: MessageString.shared.existStudent, studentName))
        } else {
            student[studentName] = []
            print(String(format: MessageString.shared.addStudentComplete, studentName))
        }
    } else {
        print(MessageString.shared.inputError)
    }
}

func deleteStudent() {
    print(MessageString.shared.deleteStudetDescription)
    guard let studentName = readLine() else { return }
    
    if studentName != "" {
        if let _ = student[studentName] {
            student[studentName] = nil
            print(String(format: MessageString.shared.deleteStudentComplete, studentName))
        } else {
            print(String(format: MessageString.shared.notExistStudentDetail, studentName))
        }
    } else {
        print(MessageString.shared.inputError)
    }
}

func addGrade() {
    print(MessageString.shared.addGradeDescription)
    guard let gradeInfo = readLine() else { return }
    let gradeInfoArr = gradeInfo.components(separatedBy: " ")
    guard let _ = changeStringToScore(gradeInfoArr[2]) else {
        print(MessageString.shared.inputError)
        return
    }
    switch gradeInfoArr.count {
    case 3:
        if let _ = student[gradeInfoArr.first!] {
            if let index = student[gradeInfoArr.first!]?.firstIndex(where: { $0.subject == gradeInfoArr[1] }) {
                student[gradeInfoArr.first!]?[index] = Grade(subject: gradeInfoArr[1], grade: gradeInfoArr[2])
            } else {
                student[gradeInfoArr.first!]?.append(Grade(subject: gradeInfoArr[1], grade: gradeInfoArr[2]))
            }
            print(String(format: MessageString.shared.updateGradeComplete, gradeInfoArr[0], gradeInfoArr[1], gradeInfoArr[2]))
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
                print(String(format: MessageString.shared.deleteGradeComplete, gradeInfoArr[0], gradeInfoArr[1]))
            } else {
                print(String(format: MessageString.shared.notExistGrade, gradeInfoArr[0], gradeInfoArr[1]))
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
                .map { Double(changeStringToScore($0.grade) ?? 0) }
                .reduce(0, +) ?? 0) / Double(scores.count)
            
            print(String(format: MessageString.shared.averageComplete, String(average)))
        } else {
            print(String(format: MessageString.shared.notExistStudentDetail, studentName))
        }
    } else {
        print(MessageString.shared.inputError)
    }
}

func changeStringToScore(_ grade: String) -> Double? {
    switch grade {
    case "A+":
        return Score.AP.rawValue
    case "A":
        return Score.A.rawValue
    case "B+":
        return Score.BP.rawValue
    case "B":
        return Score.B.rawValue
    case "C+":
        return Score.CP.rawValue
    case "C":
        return Score.C.rawValue
    case "D+":
        return Score.DP.rawValue
    case "D":
        return Score.D.rawValue
    case "F":
        return Score.F.rawValue
    default:
        return nil
    }
}

while(true) {
    showMenu()
    selectMenu()
}
