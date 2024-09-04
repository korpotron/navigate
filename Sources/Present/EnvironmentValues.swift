import SwiftUI

public extension EnvironmentValues {
    private struct PresentActionKey: EnvironmentKey {
        static let defaultValue: PresentAction = .print
    }

    var present: PresentAction {
        get {
            self[PresentActionKey.self]
        }
        set {
            self[PresentActionKey.self] = newValue
        }
    }
}
