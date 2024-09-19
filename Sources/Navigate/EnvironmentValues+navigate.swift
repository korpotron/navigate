import SwiftUI

private struct NavigateKey: @preconcurrency EnvironmentKey {
    @MainActor
    static let defaultValue: NavigateAction = .fatal
}

public extension EnvironmentValues {
    var navigate: NavigateAction {
        get {
            self[NavigateKey.self]
        }
        set {
            self[NavigateKey.self] = newValue
        }
    }
}
