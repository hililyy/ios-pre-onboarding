//
//  MyCreditManager2Tests.swift
//  MyCreditManager2Tests
//
//  Created by 강조은 on 2023/05/12.
//

import XCTest

final class MyCreditManager2Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test평점계산() {
        let result = MyCreditManager.shared.calculateAverage([
            Grade(subject: "Swift", score: .A),
            Grade(subject: "python", score: .A),
            Grade(subject: "C++", score: .A),
            Grade(subject: "java", score: .A),
            Grade(subject: "dart", score: .A)
        ])
        XCTAssertEqual(result, 4)
    }
}
