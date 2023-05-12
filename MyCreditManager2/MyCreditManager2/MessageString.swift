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
    
    // 메뉴
    let menuDescription = """
                원하는 기능을 입력해주세요
                1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
                """
    // 학생 추가
    let addStudentDescription = "추가할 학생의 이름을 입력해주세요"
    let addStudentComplete = "%1$@ 학생을 추가했습니다."
    
    // 학생 삭제
    let deleteStudetDescription = "삭제할 학생의 이름을 입력해주세요."
    let deleteStudentComplete = "%1$@ 학생을 삭제하였습니다."
    
    // 성적 추가
    let addGradeDescription = """
                성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
                입력예) Mickey Swift A+
                만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
                """
    let updateGradeComplete = "%1$@학생의 %2$@과목이 %3$@로 추가(변경)되었습니다."
    
    // 성적 삭제
    let deleteGrade = """
                성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
                입력예) Mickey Swift
                """
    let deleteGradeComplete = "%1$@학생의 %2$@ 과목의 성적이 삭제되었습니다."
    
    // 평점
    let showScore = "평점을 알고싶은 학생의 이름을 입력해주세요."
    let averageComplete = "평점: %1$@"
    
    /* --------------- 에러 String ---------------  */
    let wrongInputMenu = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    let wrongInput = "입력이 잘못되었습니다. 다시 확인해주세요."
    let existStudent = "%1$@ 학생은 이미 존재하는 학생입니다. 추가하지 않습니다."
    let notExistStudent = "해당 학생이 존재하지 않습니다. 다시 확인해주세요."
    let notExistStudentDetail = "%1$@ 학생을 찾지 못했습니다."
    let notExistGrade = "%1$@학생의 %2$@과목의 성적이 존재하지 않습니다."
}
