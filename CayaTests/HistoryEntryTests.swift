//
//  Created by Maciej Górecki on 10/10/2021
//

import XCTest
@testable import Caya

class HistoryEntryTests: XCTestCase {
    func test_calculateSavings() {
        let sut = Entry(
            date: .init(
                month: .init(1)!,
                year: .init(2009)!
            ),
            income: 10_000,
            expenses: 4_500,
            taxes: [
                ("Tax1", 300),
                ("Tax2", 400)
            ])
        
        XCTAssertEqual(sut.savings, 4_800)
    }
}
