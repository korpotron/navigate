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
        enum MainChild {
            case details
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
                    }
                }
                .padding()
                .navigationDestination(for: MainChild.self) { child in
                    switch child {
                    case .details:
                        DetailsView()
                    }
                }
            }
            .present(for: MainChild.self) { child in
                switch child {
                case .details:
                    path = [.details]
                }
            }
            .present(for: Int.self) { value, parent in
                print("main 1 - \(value)")
                parent(value)
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
        var body: some View {
            VStack {
                PresentActionReader { action in
                    Text("Details")
                    Button("Action") {
                        action(5)
                    }
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
