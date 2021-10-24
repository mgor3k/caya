//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI
import FloatingBar

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    let onAdd: () -> Void
    
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: viewModel.selectedMenuItem.gradientPosition
            )
                .animation(.default, value: viewModel.selectedMenuItem)
            
            switch viewModel.selectedMenuItem {
            case .home:
                list
            case .profile:
                Text("TODO")
            }
            
            LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
                .frame(height: 150)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            
            FloatingBar(
                items: HomeMenuItem.allCases,
                selectedItem: $viewModel.selectedMenuItem
            )
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .navigationTitle(navigationTitle)
        .toolbar {
            ToolbarItemGroup {
                if case .home = viewModel.selectedMenuItem {
                    Button(action: onAdd) {
                        Image(systemName: "plus.app.fill")
                    }
                    .foregroundColor(Color(uiColor: .label))
                } else {
                    Spacer()
                }
            }
        }
    }
}

private extension HomeView {
    var navigationTitle: String {
        switch viewModel.selectedMenuItem {
        case .home:
            return viewModel.currency.formatted(viewModel.savings)
        case .profile:
            return "Profile"
        }
    }
    
    var list: some View {
        List {
            Section {
                Text("Your **History**")
                    .padding(.horizontal, Padding.screenEdge)
                    .font(.title)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(viewModel.sections) { section in
                Section {
                    ForEach(section.entries) { entry in
                        HomeCell(entry: entry, currency: viewModel.currency)
                            .transition(.scale)
                            .padding(
                                .bottom,
                                viewModel.sections.last == section && section.isLast(entry) ? 100 : 0
                            )
                    }
                    .onDelete { row in
                        viewModel.deleteEntry(section.entries[row.first!])
                    }
                } header: {
                    Text("\(section.title)")
                        .font(.title3)
                        .tracking(6)
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
        .animation(
            .spring().delay(0.2),
            value: viewModel.sections
        )
    }
}

extension HomeMenuItem: FloatingBarItem {}

private extension HomeMenuItem {
    var gradientPosition: GradientBackgroundView.Position {
        switch self {
        case .home:
            return .leading
        case .profile:
            return .trailing
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: .init(
                provider: MockPersistanceManager(),
                preference: MockPreferences()
            ),
            onAdd: {}
        )
            .environment(\.colorScheme, .dark)
    }
}
