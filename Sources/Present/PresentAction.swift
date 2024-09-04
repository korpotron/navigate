import Foundation

public struct PresentAction {
    private let handler: (Any) -> Void

    public init(handler: @escaping (_ object: Any) -> Void) {
        self.handler = handler
    }

    public func callAsFunction(_ dispatch: Any) {
        handler(dispatch)
    }
}

public extension PresentAction {
    static let fatal: Self = .init { object in
        fatalError("PresentAction | handler missing for \(object)")
    }
}
