import SwiftUI

@MainActor
public struct NavigateBehaviour<T> {
    let handler: (_ result: inout [T], _ route: T) -> Void
}

public extension NavigateBehaviour where T: Equatable {
    static var appending: Self {
        .init { result, route in
            result += [route]
        }
    }

    static var jumping: Self {
        .init { result, route in
            if let index = result.lastIndex(of: route) {
                result = Array(result.prefix(upTo: index + 1))
            } else {
                result += [route]
            }
        }
    }

    static var `default`: Self {
        .appending
    }
}
