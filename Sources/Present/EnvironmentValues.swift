import SwiftUI

struct PresentActionKey: EnvironmentKey {
    static let defaultValue: PresentAction = .root
}

public extension EnvironmentValues {
    var present: PresentAction {
        get {
            self[PresentActionKey.self]
        }
        set {
            self[PresentActionKey.self] = newValue
        }
    }
}
