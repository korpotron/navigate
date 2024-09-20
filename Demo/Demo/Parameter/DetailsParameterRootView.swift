import Navigate
import SwiftUI

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

#Preview {
    DetailsParameterRootView()
}
