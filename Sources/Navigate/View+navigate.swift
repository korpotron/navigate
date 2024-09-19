import SwiftUI

public extension View {
    @inlinable
    func navigate<T>(_: T.Type, handler: @escaping (_ object: T) -> Void) -> some View {
        modifier(NavigationViewModifier(handler: handler))
    }
}

public extension View {
    func navigate<A, B>(_ type: A.Type, in binding: Binding<[B]>, behaviour: NavigateBehaviour<B>, mapping: @escaping (A) -> B) -> some View {
        navigate(type) { route in
            behaviour.handler(&binding.wrappedValue, mapping(route))
        }
    }
}

public extension View {
    func navigate<T: Equatable>(_ type: T.Type, in binding: Binding<[T]>) -> some View {
        navigate(type, in: binding, behaviour: .appending)
    }
}

public extension View {
    func navigate<T>(_ type: T.Type, in binding: Binding<[T]>, behaviour: NavigateBehaviour<T>) -> some View {
        navigate(type, in: binding, behaviour: behaviour, mapping: { $0 })
    }
}
