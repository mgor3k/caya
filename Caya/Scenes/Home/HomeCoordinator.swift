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
                        HomeView(
                            viewModel: .init(
                                provider: dependencies.persistance,
                                preference: dependencies.preferences
                            ),
                            onAdd: showNewEntry,
                            onProfileRoute: showProfileDetail
                        )
                    case .credits:
                        CreditsView()
                            .background(NavigationConfigurator(configure: { nav in
                                nav.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                            }))
                    }
                }
            case .newEntry:
                ModalView {
                    NewEntryView(
                        viewModel: .init(
                            preferences: dependencies.preferences,
                            persistance: dependencies.persistance
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
    }
    
    func showNewEntry() {
        modal.present(.newEntry, style: .sheet)
    }
    
    func showProfileDetail(_ route: ProfileRoute) {
        switch route {
        case .credits:
            stack.push(.credits)
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}
