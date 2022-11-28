//
//  main.swift
//  MyCreditManager
//
//  Created by 강조은 on 2022/11/24.
//

import Foundation

var studentScoreList = [String:[(String, String)]]()
class MyCreditManager {
    func showQuestion(inputNum: String) -> Bool {
        switch inputNum {
        case "1":
            addStudent()
        case "2":
            deleteStudent()
        case "3":
            addStudentScore()
        case "4":
            deleteStudentScore()
        case "5":
            showStudentScore()
        case "X":
            print("프로그램을 종료합니다...")
            return false
        default:
            mistakeMenuInput()
        }
        return true
    }
    
    func addStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        let studentName = readLine() ?? ""
        if studentName == "" {
            mistakeInput()
        } else {
            if studentScoreList[studentName] != nil {
                print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            } else {
                studentScoreList[studentName] = []
                print("\(studentName) 학생을 추가했습니다.")
            }
        }
    }
    
    func deleteStudent() {
        print("삭제할 학생의 이름을 입력해주세요")
        let studentName = readLine() ?? ""
        if studentScoreList[studentName] != nil {
            studentScoreList[studentName] = nil
            print("\(studentName) 학생을 삭제하였습니다.")
        } else {
            print("\(studentName) 학생을 찾지 못했습니다.")
        }
    }
    
    func addStudentScore() {
        print("""
        성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift A+
        만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """)
        let studentInfoString = readLine() ?? ""
        var studentInfoArray:[String] = studentInfoString.components(separatedBy: " ")
        if studentInfoArray.count == 3 && studentScoreList[studentInfoArray[0]] != nil {
            guard var arrayOfTuples = studentScoreList[studentInfoArray[0]] else { return }
            arrayOfTuples.removeAll(where: {$0.0 == studentInfoArray[1]})
            arrayOfTuples.append((studentInfoArray[1],studentInfoArray[2]))
            studentScoreList[studentInfoArray[0]] = arrayOfTuples
            print("\(studentInfoArray[0]) 학생의 \(studentInfoArray[1]) 과목이 \(studentInfoArray[2])로 추가(변경) 되었습니다.")
        } else {
            studentInfoArray = []
            mistakeInput()
        }
    }
    
    func deleteStudentScore() {
        print("""
        성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift
        """)
        let studentInfoString = readLine() ?? ""
        var studentInfoArray:[String] = studentInfoString.components(separatedBy: " ")
        if studentInfoArray.count == 2 {
            if studentScoreList[studentInfoArray[0]] != nil {
                guard var arrayOfTuples = studentScoreList[studentInfoArray[0]] else { return }
                arrayOfTuples.removeAll(where: {$0.0 == studentInfoArray[1]})
                studentScoreList[studentInfoArray[0]] = arrayOfTuples

                print("\(studentInfoArray[0]) 학생의 \(studentInfoArray[1]) 과목의 성적이 삭제되었습니다.")
            } else {
                print("\(studentInfoArray[0]) 학생을 찾지 못했습니다.")
            }
        } else {
            studentInfoArray = []
            mistakeInput()
        }
    }
    
    func showStudentScore() {
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        let studentName = readLine() ?? ""
        if studentName == "" {
            mistakeInput()
        } else {
            if studentScoreList[studentName] != nil {
                guard let scoreList = studentScoreList[studentName] else { return }
                var sum: Double = 0
                for score in scoreList {
                    print("\(score.0): \(score.1)")
                    sum = sum + changeScoreStringToInt(score: score.1)
                }
                print("평점 : \(String(format: "%.2f", sum / Double(scoreList.count)))")
            } else {
                print("\(studentName) 학생을 찾지 못했습니다.")
            }
        }
    }
    
    func mistakeMenuInput() {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
    
    func mistakeInput() {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    
    func changeScoreStringToInt(score: String) -> Double {
        switch score {
        case "A+":
            return 4.5
        case "A":
            return 4.0
        case "B+":
            return 3.5
        case "B":
            return 3.0
        case "C+":
            return 2.5
        case "C":
            return 2.0
        case "D+":
            return 1.5
        case "D":
            return 1.0
        case "F":
            return 0
        default :
            break
        }
        return 0
    }
}

while(true) {
    print("""
    원하는 기능을 입력해 주세요
    1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
    """)
    let inputNum = readLine() ?? ""
    if MyCreditManager().showQuestion(inputNum: inputNum) {
        continue
    } else {
        break
    }
}

