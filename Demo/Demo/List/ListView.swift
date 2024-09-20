import SwiftUI

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
            Button("Unhandled") {
                navigate(OtherRoute.unhandled)
            }
        }
        .navigationTitle("List")
    }
}

#Preview {
    ListView()
}
