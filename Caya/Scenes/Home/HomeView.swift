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
                SavingsSectionView(
                    savings: viewModel.savings,
                    onAdd: onAdd
                )
                
                historySection
            }
                .padding(CGFloat?.defaultPadding)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
        }
    }
}

private extension HomeView {
    var historySection: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Your **History**")
                .font(.title)
            
            ScrollView {
                LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                    ForEach(viewModel.sections) { section in
                        Section {
                            ForEach(section.entries) { entry in
                                HistoryView(entry)
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
                provider: MockPersistanceManager()
            ),
            onAdd: {}
        )
            .environment(\.colorScheme, .dark)
    }
}
