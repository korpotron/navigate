import SwiftUI

#Preview {
    struct RootView: View {
        var body: some View {
            TabView {
                MainView()
                    .tabItem {
                        Label("Main", systemImage: "ant")
                    }
            }
        }
    }

    struct MainView: View {
        enum MainChild: Hashable {
            case details
            case number(Int)
        }

        @State var path: [MainChild] = []
        @State var crash = false

        var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    Toggle("Crash", isOn: $crash)
                    PresentActionReader { action in
                        Button("Lorem") {
                            action(MainChild.details)
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .padding()
                .navigationDestination(for: MainChild.self) { child in
                    switch child {
                    case .details:
                        DetailsView()
                    case let .number(value):
                        Text("number \(value)")
                    }
                }
            }
            .present(for: MainChild.self) { child in
                switch child {
                case .details:
                    path = [.details]
                case .number:
                    break
                }
            }
            .present(for: Int.self) { value, parent in
                print("main 1 - \(value)")
                parent(value)

                if !crash {
                    path += [.number(value)]
                }
            }
            .present(for: Int.self) { value, parent in
                print("main 2 - \(value)")
                if crash {
                    parent(value)
                }
            }
        }
    }

    struct DetailsView: View {
        @Environment(\.present)
        var present

        @Environment(\.dismiss)
        var dismiss

        var body: some View {
            VStack {
                Text("Details")
                Button("Present") {
                    present(5)
                }
                Button("Dismiss") {
                    dismiss()
                }
            }
            .present(for: Int.self) { value, parent in
                print("details - \(value)")
                parent(value)
            }
        }
    }

    return RootView()
}
