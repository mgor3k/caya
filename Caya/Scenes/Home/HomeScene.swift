//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI

struct HomeScene: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 32) {
                Text("Your ")
                    .font(.title)
                +
                Text("History")
                    .font(.title)
                    .bold()
                
                ScrollView {
                    ForEach(viewModel.history) { entry in
                        HistoryView(entry)
                    }
                }
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
            )
        )
            .environment(\.colorScheme, .dark)
    }
}
