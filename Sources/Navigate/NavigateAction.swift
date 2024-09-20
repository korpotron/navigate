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
    static func output(_ output: @escaping (String) -> Void) -> Self {
        .init { object in
            output("Navigate: unhandled \(type(of: object)).\(object)")
        }
    }

    static let fatal: Self = .output { message in
        fatalError(message)
    }

    static let print: Self = .output { message in
        Swift.print(message)
    }

    static let `default`: Self = .print
}
