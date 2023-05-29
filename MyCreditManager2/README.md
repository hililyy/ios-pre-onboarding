# 원티드 프리온보딩 챌린지 iOS과정 사전과제
> 성적관리 프로그램 만들기

학생추가, 학생삭제, 성적추가(변경), 성적삭제, 평점보기, 종료 기능을 가진 성적관리 프로그램을 만듭니다.

</br>

# 적용사항
- [x] 재귀함수
- [x] if문 → guard문
- [x] 오류처리
- [x] 고차함수
- [ ] 객체지향 특징, SOLID
- [x] final, private
- [x] 추상화(프로토콜 사용)
- [x] 테스트코드

</br>

# 고민한부분

</br>

## 1. String을 어떻게 관리해야할까?
- 싱글톤을 이용해 하나의 파일로 관리하였습니다. 여러개의 객체를 생성할 필요가 없다고 생각해 싱글톤을 사용하였습니다.
- 여러줄의 String을 """(따옴표 3개)로 묶어주어 보다 직관적으로 표기하였습니다.

</br>

## 2. 에러처리
```
enum ErrorCase: Error, CustomStringConvertible {
    case wrongInput
    case existStudent(name: String)
    case notExistStudent
    case notExistStudentDetail(name: String)
    
    var description: String {
        switch self {
        case .wrongInput:
            return MessageString.shared.wrongInput
        case .existStudent(let name):
            return String(format: MessageString.shared.existStudent, name)
        case .notExistStudent:
            return MessageString.shared.notExistStudent
        case .notExistStudentDetail(let name):
            return String(format: MessageString.shared.notExistStudentDetail, name)
        }
    }
}
```
- 예외 요소가 많은 프로그램 특성상 확실한 예외처리가 필요했습니다.
- 발생할 수 있는 예외들을 Error Enum으로 관리하였고, CustomStringConvertible을 사용하여 사용하는 부분에서 보다 쉽게 에러 메시지를 출력할 수 있도록 하였습니다.
- description의 return으로 바로 오류 메시지 string을 리턴할 수 있었지만 문자열을 한곳에서 모두 관리하는 통일성을 주기 위해 MessageString에서 불러오도록 처리하였습니다.

</br>

## 3. enum 구조
```
enum Score {
    case AP, A, BP, B, CP, C, DP, D, F

    var score: Double {
        switch self {
        case .AP:
            return 4.5
        case .A:
// ...
        }
    }

    var description: String {
        switch self {
        case .AP:
            return "A+"
        case .A:
// ...
        }
    }
}

extension Score {
    init?(description: String) {
        switch description {
        case Score.AP.description:
            self = .AP
        case Score.A.description:
// ...
        }
    }
}
```
- 점수에 대한 enum에서 case의 이름으로 특수문자를 사용할 수 없는 부분에서 고민이 생겼습니다.
- 평점 출력시 '+'기호를 출력해야했기 때문에 case명은 식별하기 위한 표기값으로만 사용하였고, score과 description 변수를 추가하여 점수(Double)와 등급(String)을 관리하였습니다.
- 입력받은 string을 통해 enum으로 저장해야했기 때문에 extension을 통해 string to enum을 위한 기능을 추가하였습니다.

</br>

## 4. 가독성 좋은 코드
- 다양하고 많은 예외들과 기능들을 구현하다보니 코드가 점점 직관성이 떨어졌습니다.
- 하나의 함수에서 최대한 print하는 부분을 다른 부분으로 옮기고, guard문을 통해 잘못된 입력시 빠른 함수 종료를 유도하여 보다 단순한 로직을 위해 노력하였습니다.

