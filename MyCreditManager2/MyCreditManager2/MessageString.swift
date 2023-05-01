//
//  MessageString.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/04/30.
//

import Foundation

struct MessageString {
    
    static var shared = MessageString()
    private init() {}
    
    let menu = """
                원하는 기능을 입력해주세요
                1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
                """
    
    let addStudent = "추가할 학생의 이름을 입력해주세요"
    let inputError = "입력이 잘못되었습니다. 다시 확인해주세요."
    let deleteStudet = "삭제할 학생의 이름을 입력해주세요."
    let addGrade = """
                성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
                입력예) Mickey Swift A+
                만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
                """
    let notExistStudent = "해당 학생이 존재하지 않습니다. 다시 확인해주세요."
    let deleteGrade = """
                성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
                입력예) Mickey Swift
                """
    let showScore = "평점을 알고싶은 학생의 이름을 입력해주세요."
}
