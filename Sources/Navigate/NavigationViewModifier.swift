import SwiftUI

public struct NavigationViewModifier<T>: ViewModifier {
    private let handler: (T) -> Void

    public init(handler: @escaping (T) -> Void) {
        self.handler = handler
    }

    @Environment(\.navigate)
    private var navigate: NavigateAction

    public func body(content: Content) -> some View {
        let action = NavigateAction { object in
            if let object = object as? T {
                handler(object)
            } else {
                navigate(object)
            }
        }

        content
            .environment(\.navigate, action)
    }
}
