import SwiftUI

struct ListRootView: View {
    @State
    var path: [ListChild] = []

    var body: some View {
        NavigationStack(path: $path) {
            ListView()
                .navigationDestination(for: ListChild.self) { route in
                    switch route {
                    case .details:
                        DetailsRootView()
                    case .parameter:
                        DetailsParameterRootView()
                    }
                }
        }
        .navigate(ListRoute.self, in: $path, behaviour: .jumping, mapping: ListChild.of(_:))
    }
}

#Preview {
    ListRootView()
}
