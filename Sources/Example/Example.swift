import Navigate
import SwiftUI

enum TabRoute {
    case list
    case gear
}

enum ListRoute {
    case details
    case parameter
}

enum OtherRoute {
    case unexpected
}

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

struct DetailsParameterRootView: View {
    @Navigate(ListRoute.self)
    var navigate

    var body: some View {
        VStack {
            Text("Parameter")
            Button("Details") {
                navigate(ListRoute.details)
            }
        }
    }
}

struct DetailsRootView: View {
    @Navigate(ListRoute.self)
    var navigate

    var body: some View {
        VStack {
            Text("Details")
            Button("Details") {
                navigate(ListRoute.details)
            }
            Button("Parameter") {
                navigate(ListRoute.parameter)
            }
        }
    }
}

struct ListView: View {
    @Environment(\.navigate)
    var navigate

    var body: some View {
        List {
            Button("Details") {
                navigate(ListRoute.details)
            }
            Button("Gear") {
                navigate(TabRoute.gear)
            }
            Button("Unexpected") {
                navigate(OtherRoute.unexpected)
            }
        }
        .navigationTitle("List")
    }
}

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

struct GearRootView: View {
    @Navigate(TabRoute.self)
    var navigate

    var body: some View {
        VStack {
            Text("Gear")
            Button("Go to list") {
                navigate(.list)
            }
        }
    }
}

struct TabRootView: View {
    @State
    var current: TabRoute = .list

    var body: some View {
        TabView(selection: $current) {
            Tab(value: TabRoute.list) {
                ListRootView()
            } label: {
                Label("List", systemImage: "list.bullet.clipboard")
            }
            Tab(value: TabRoute.gear) {
                GearRootView()
            } label: {
                Label("Gear", systemImage: "gear")
            }
        }
        .navigate(TabRoute.self) { route in
            current = route
        }
    }
}

struct AppRootView: View {
    var body: some View {
        TabRootView()
    }
}

#Preview {
    AppRootView()
}
