//
//  Created by Maciej Górecki on 10/10/2021
//

import Combine
import XCTest
@testable import Caya

//class HomeViewModelTests: XCTestCase {
//    func test_calculateTotalSavings() async throws {
//        let sut = HomeViewModel(
//            provider: Provider(),
//            preference: MockPreferences()
//        )
//        
//        XCTAssertEqual(sut.savings, -2_500)
//    }
//}
//
//private extension HomeViewModelTests {
//    struct Provider: EntryProviding {
//        func removeEntries(_ entries: [Entry]) {
//            
//        }
//        
//        func getEntries() -> [Entry] {
//            [
//                .init(date: .init(month: .init(1)!, year: .init(2009)!), income: 5_000, expenses: 300, taxes: [("1", 100)]),
//                .init(date: .init(month: .init(2)!, year: .init(2009)!), income: 2_000, expenses: 9_000, taxes: [("1", 200)]),
//                .init(date: .init(month: .init(3)!, year: .init(2009)!), income: 1_000, expenses: 600, taxes: [("1", 300)])
//            ]
//        }
//        func getEntriesUpdates() -> AnyPublisher<[Entry], Never> {
//            Empty().eraseToAnyPublisher()
//        }
//    }
//}
