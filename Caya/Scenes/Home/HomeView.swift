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
            
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                    .padding(.horizontal, Padding.screenEdge)
                historySection
            }
                .padding(.top, Padding.screenEdge)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
        }
    }
}

private extension HomeView {
    var headerSection: some View {
        HStack {
            Text(viewModel.currency.formatted(viewModel.savings))
                .font(.title)
                .bold()
            
            Spacer()
            
            Button(action: onAdd) {
                Image(systemName: "plus")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color(uiColor: .label).opacity(0.5), lineWidth: 1)
                )
            }
            .foregroundColor(Color(uiColor: .label))
        }
    }
    
    var historySection: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Your **History**")
                .padding(.horizontal, Padding.screenEdge)
                .font(.title)
            
            ScrollView {
                LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
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
                        } header: {
                            Text("\(section.title)")
                                .font(.title3)
                                .tracking(6)
                                .padding(.horizontal, Padding.screenEdge)
                        }
                    }
                }
                .animation(
                    .spring().delay(0.2),
                    value: viewModel.sections
                )
            }
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
