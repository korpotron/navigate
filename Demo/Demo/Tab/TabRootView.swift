import Navigate
import SwiftUI

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

#Preview {
    TabRootView()
}
