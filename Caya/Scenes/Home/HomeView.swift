//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    let onAdd: () -> Void
    
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: .leading
            )
            
            list
        }
        .navigationTitle(viewModel.currency.formatted(viewModel.savings))
        .toolbar {
            ToolbarItem {
                Button(action: onAdd) {
                    Image(systemName: "plus.app.fill")
                }
                .foregroundColor(Color(uiColor: .label))
            }
        }
    }
}

private extension HomeView {
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
                                section.isLast(entry) ? 16 : 0
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
