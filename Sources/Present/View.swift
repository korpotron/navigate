import SwiftUI

public extension View {
    @inlinable
    func present<T>(for type: T.Type, block: @escaping (_ object: T) -> Void) -> some View {
        present(for: type) { object, _ in
            block(object)
        }
    }

    @inlinable
    func present<T>(for type: T.Type, block: @escaping (_ object: T, _ parent: PresentAction) -> Void) -> some View {
        PresentActionReader { action in
            self.environment(\.present, PresentAction { object in
                if let object = object as? T {
                    block(object, action)
                } else {
                    action(object)
                }
            })
        }
    }
}
