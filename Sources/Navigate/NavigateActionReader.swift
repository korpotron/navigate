import SwiftUI

public struct NavigateActionReader<Content: View>: View {
    let content: (NavigateAction) -> Content

    public init(@ViewBuilder content: @escaping (_ action: NavigateAction) -> Content) {
        self.content = content
    }

    @Environment(\.navigate)
    private var navigate

    public var body: some View {
        content(navigate)
    }
}
