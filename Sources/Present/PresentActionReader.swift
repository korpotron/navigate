import SwiftUI

public struct PresentActionReader<Content: View>: View {
     let content: (PresentAction) -> Content

    @Environment(\.present)
    private var present

    public init(@ViewBuilder content: @escaping (_ action: PresentAction) -> Content) {
        self.content = content
    }

    public var body: some View {
        content(present)
    }
}
