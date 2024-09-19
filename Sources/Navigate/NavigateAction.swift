import Foundation

@MainActor
public struct NavigateAction {
    private let handler: NavigateHandler

    public init(handler: @escaping NavigateHandler) {
        self.handler = handler
    }

    public func callAsFunction(_ value: Any) {
        handler(value)
    }
}

public extension NavigateAction {
    static let fatal: Self = .init { object in
        print("fatal \(object)")
    }
}
