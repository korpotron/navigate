import SwiftUI

@propertyWrapper
public struct Navigate<T>: DynamicProperty {
    public let route: T.Type

    public init(_ route: T.Type) {
        self.route = route
    }

    @Environment(\.navigate)
    private var navigate

    @MainActor
    public struct Wrapper {
        let action: NavigateAction

        public func callAsFunction(_ value: T) {
            action(value)
        }
    }

    public var wrappedValue: Wrapper {
        Wrapper(action: navigate)
    }
}
