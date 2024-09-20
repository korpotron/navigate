@testable import Navigate
import XCTest

final class NavigateActionTests: XCTestCase {
    @MainActor
    func test() throws {
        var spy: [String] = []
        let sut = NavigateAction.output { message in
            spy.append(message)
        }

        sut(42)

        XCTAssertEqual(spy.count, 1)
        XCTAssertEqual(spy.first, "Navigate: unhandled Int.42")
    }
}
