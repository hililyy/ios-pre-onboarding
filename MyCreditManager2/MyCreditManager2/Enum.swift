//
//  Enum.swift
//  MyCreditManager2
//
//  Created by 강조은 on 2023/04/30.
//

import Foundation

enum ProgramMenu: String {
    case addStudent = "1" // 학생추가
    case deleteStudent = "2" // 학생삭제
    case addGrade = "3" // 성적추가(변경)
    case deleteGrade = "4" // 성적삭제
    case showScore = "5" // 평점보기
    case exit = "X" // 종료
}

enum Score: Double {
    case AP = 4.5
    case A = 4.0
    case BP = 3.5
    case B = 3.0
    case CP = 2.5
    case C = 2.0
    case DP = 1.5
    case D = 1.0
    case F = 0
}
