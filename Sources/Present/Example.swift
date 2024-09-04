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
        @State var chaining = true

        var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    Toggle("Chaining", isOn: $chaining)
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

                if chaining {
                    parent(value)
                }
            }
            .present(for: Int.self) { value, parent in
                print("main 2 - \(value)")
                parent(value)
            }
        }
    }

    struct DetailsView: View {

        @Environment(\.dismiss)
        var dismiss

        @State
        var value = 0

        var body: some View {
            PresentActionReader { present in
                VStack {
                    Text("Details \(value)")
                    Button("Present") {
                        value += 1
                        present(value)
                    }
                    Button("Dismiss") {
                        dismiss()
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
        .present(for: Int.self) { object, parent in
            print("root \(object)")
            parent(object)
        }
}
