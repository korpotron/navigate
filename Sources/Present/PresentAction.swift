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
    static let root: Self = .init { object in
        print("present | handler missing for \(object)")
    }
}
