import Foundation

enum ListChild {
    case details
    case parameter

    static func of(_ value: ListRoute) -> Self {
        switch value {
        case .details: .details
        case .parameter: .parameter
        }
    }
}
