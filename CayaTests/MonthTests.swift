//
//  Created by Maciej Górecki on 09/10/2021
//

import XCTest
@testable import Caya

class MonthTests: XCTestCase {
    func test_initWithIncorrectValue_returnsNil() {
        XCTAssertNil(Month(13))
        XCTAssertNil(Month(0))
        XCTAssertNil(Month(-1))
        XCTAssertNil(Month(69))
    }
    
    func test_initWithCorrectValue_returnsObject() {
        (1...12)
            .map(Month.init)
            .forEach {
                XCTAssertNotNil($0, "Invalid month")
            }
    }
}
