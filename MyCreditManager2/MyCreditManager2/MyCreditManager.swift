//
//  MyCreditManager.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/05/10.
//

import Foundation

final class MyCreditManager {
    
    static let shared = MyCreditManager()
    private init() {}
    
    private var students: [String: [Grade]] = [:]

    func showMenu() {
        print(MessageString.shared.menuDescription)
    }

    func selectMenu() throws {
        guard let selectedNum = ProgramMenu(rawValue: readLine() ?? "") else {
            throw ErrorCase.wrongInputMenu
        }
        do {
            switch selectedNum {
            case .addStudent:
                try addStudent()
            case .deleteStudent:
                try deleteStudent()
            case .addGrade:
                try addGrade()
            case .deleteGrade:
                try deleteGrade()
            case .showScore:
                try printScore()
            case .exit:
                exit(0)
            }
        } catch { print(error) }
    }
}

extension MyCreditManager: MenuProtocol {
    
    func addStudent() throws {
        print(MessageString.shared.addStudentDescription)
        
        guard let name = readLine(),
              !name.contains(" "),
              name != "" else {
            throw ErrorCase.wrongInput
        }
        
        guard students[name] == nil else {
            throw ErrorCase.existStudent(name: name)
        }
        
        students[name] = []
        print(String(format: MessageString.shared.addStudentComplete, name))

    }

    func deleteStudent() throws {
        print(MessageString.shared.deleteStudetDescription)
        
        guard let name = readLine(),
              !name.contains(" "),
              !name.isEmpty else {
            throw ErrorCase.wrongInput
        }
        
        guard let _ = students[name] else {
            throw ErrorCase.notExistStudentDetail(name: name)
        }
        
        students[name] = nil
        print(String(format: MessageString.shared.deleteStudentComplete, name))
    }

    func addGrade() throws {
        print(MessageString.shared.addGradeDescription)
        
        guard let grade = readLine(),
              let name = grade.components(separatedBy: " ").first,
              let subject = grade.components(separatedBy: " ").dropFirst().first,
              let score = Score(description: grade.components(separatedBy: " ").last ?? "") else {
            throw ErrorCase.wrongInput
        }
        
        let newGrade = Grade(subject: subject, score: score)
        
        guard let grades = students[name] else {
            throw ErrorCase.notExistStudent
        }
        
        if let index = grades.firstIndex(where: { $0.subject == newGrade.subject }) {
            students[name]?[index] = newGrade
        } else {
            students[name]?.append(newGrade)
        }
        
        print(String(format: MessageString.shared.updateGradeComplete, name, subject, score.description))
    }

    func deleteGrade() throws {
        print(MessageString.shared.deleteGrade)
        
        guard let grade = readLine(),
              let name = grade.components(separatedBy: " ").first,
              let subject = grade.components(separatedBy: " ").last else {
            throw ErrorCase.wrongInput
        }
        
        guard let grades = students[name] else {
            throw ErrorCase.notExistStudent
        }
        
        if let index = grades.firstIndex(where: { $0.subject == subject }) {
            students[name]?.remove(at: index)
            print(String(format: MessageString.shared.deleteGradeComplete, name, subject))
        } else {
            throw ErrorCase.notExistGrade(name: name, subject: subject)
        }
    }

    func printScore() throws {
        print(MessageString.shared.showScore)
        
        guard let name = readLine(),
              !name.isEmpty else {
            throw ErrorCase.wrongInput
        }
        
        guard let scores = students[name] else {
            throw ErrorCase.notExistStudentDetail(name: name)
        }
        
        for score in scores {
            print("\(score.subject): \(score.score.description)")
        }
        
        let average = calculateAverage(scores)
        print(String(format: MessageString.shared.averageComplete, String(average)))
    }
    
    func calculateAverage(_ scores: [Grade]) -> Double {
        return (scores
            .map { $0.score.score }
            .reduce(0, +)) / Double(scores.count)
    }
}
