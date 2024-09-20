import Navigate
import SwiftUI

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

#Preview {
    DetailsRootView()
}
