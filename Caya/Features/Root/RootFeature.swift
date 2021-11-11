//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI
import FlowStacks

struct RootFeature: View {
    @State private var stack = NFlow<Screen>(root: .main)
    @State private var modal = PFlow<Modal>(root: .main)
    
    let dependencies: Dependencies

    var body: some View {
        PStack($modal) { modal in
            switch modal {
            case .main:
                NStack($stack) { screen in
                    switch screen {
                    case .main:
                        HomeFeature(
                            dependencies: dependencies,
                            action: handleHomeAction
                        )
                    case .credits:
                        CreditsView()
                    }
                }
            case .newEntry:
                ModalView {
                    NewEntryView(
                        viewModel: .init(
                            NewEntryController(
                                preferences: dependencies.preferences,
                                repository: dependencies.repository
                            )
                        )
                    )
                }
            case let .editEntry(entry):
                ModalView {
                    NewEntryView(
                        viewModel: .init(
                            EditEntryController(
                                entry: entry,
                                preferences: dependencies.preferences,
                                repository: dependencies.repository
                            )
                        )
                    )
                }
            }
        }
    }
}

extension RootFeature {
    enum Screen {
        case main
        case credits
    }
    
    enum Modal {
        case main
        case newEntry
        case editEntry(Entry)
    }
    
    func handleHomeAction(_ action: HomeFeature.Action) {
        switch action {
        case .add:
            modal.present(.newEntry)
        case let .edit(entry):
            modal.present(.editEntry(entry))
        case let .showProfile(route):
            switch route {
            case .credits:
                stack.push(.credits)
            }
        }
    }
}
