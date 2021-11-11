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
                    case .taxes:
                        Text("TODO")
                    case .credits:
                        CreditsFeature(
                            dependencies: dependencies
                        )
                    }
                }
            case .newEntry:
                ModalView {
                    EntryDetailsFeature(
                        dependencies: dependencies,
                        mode: .new
                    )
                }
            case let .editEntry(entry):
                ModalView {
                    EntryDetailsFeature(
                        dependencies: dependencies,
                        mode: .edit(entry)
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
        case taxes
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
            case .showTaxes:
                stack.push(.taxes)
            case .showCredits:
                stack.push(.credits)
            }
        }
    }
}
