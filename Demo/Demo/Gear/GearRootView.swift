import Navigate
import SwiftUI

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

#Preview {
    GearRootView()
}
