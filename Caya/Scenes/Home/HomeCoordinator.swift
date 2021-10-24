//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI
import FlowStacks

struct HomeCoordinator: View {
    @State private var stack = NFlow<Screen>(root: .main)
    @State private var modal = PFlow<Modal>(root: .main)
    
    @Environment(\.dependencies) var dependencies

    var body: some View {
        PStack($modal) { modal in
            switch modal {
            case .main:
                NStack($stack) { screen in
                    switch screen {
                    case .main:
                        HomeContainerView { page in
                            switch page {
                            case .home:
                                HistoryView(
                                    viewModel: .init(
                                        provider: dependencies.persistance,
                                        preference: dependencies.preferences
                                    ),
                                    onAdd: showNewEntry,
                                    onEdit: showEditEntry
                                )
                            case .profile:
                                ProfileView(
                                    viewModel: .init(
                                        preferences: dependencies.preferences
                                    ),
                                    onRoute: showProfileDetail
                                )
                            }
                        }
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
                                service: dependencies.persistance
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
                                service: dependencies.persistance
                            )
                        )
                    )
                }
            }
        }
    }
}

extension HomeCoordinator {
    enum Screen {
        case main
        case credits
    }
    
    enum Modal {
        case main
        case newEntry
        case editEntry(Entry)
    }
    
    func showNewEntry() {
        modal.present(.newEntry)
    }
    
    func showEditEntry(_ entry: Entry) {
        modal.present(.editEntry(entry))
    }
    
    func showProfileDetail(_ route: ProfileRoute) {
        switch route {
        case .credits:
            stack.push(.credits)
        }
    }
}
