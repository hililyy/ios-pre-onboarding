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

enum Score {
    case AP, A, BP, B, CP, C, DP, D, F

    var score: Double {
        switch self {
        case .AP:
            return 4.5
        case .A:
            return 4.0
        case .BP:
            return 3.5
        case .B:
            return 3.0
        case .CP:
            return 2.5
        case .C:
            return 2.0
        case .DP:
            return 1.5
        case .D:
            return 1.0
        case .F:
            return 0.0
        }
    }

    var description: String {
        switch self {
        case .AP:
            return "A+"
        case .A:
            return "A"
        case .BP:
            return "B+"
        case .B:
            return "B"
        case .CP:
            return "C+"
        case .C:
            return "C"
        case .DP:
            return "D+"
        case .D:
            return "D"
        case .F:
            return "F"
        }
    }
}

extension Score {
    init?(description: String) {
        switch description {
        case Score.AP.description:
            self = .AP
        case Score.A.description:
            self = .A
        case Score.BP.description:
            self = .BP
        case Score.B.description:
            self = .B
        case Score.CP.description:
            self = .CP
        case Score.C.description:
            self = .C
        case Score.DP.description:
            self = .DP
        case Score.D.description:
            self = .D
        case Score.F.description:
            self = .F
        default:
            return nil
        }
    }
}
