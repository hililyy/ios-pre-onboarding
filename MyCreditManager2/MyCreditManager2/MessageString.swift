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
}
