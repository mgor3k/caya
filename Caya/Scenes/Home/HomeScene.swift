//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: ViewModel
    let onAdd: () -> Void
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 32) {
                SavingsSectionView(
                    savings: viewModel.savings,
                    onAdd: onAdd
                )
                
                HistorySectionView(
                    entries: viewModel.history
                )
            }
                .padding(24)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
        }
        .task {
            await viewModel.fetchHistory()
        }
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene(
            viewModel: .init(
                provider: MockHistoryProvider()
            ),
            onAdd: {}
        )
            .environment(\.colorScheme, .dark)
    }
}
