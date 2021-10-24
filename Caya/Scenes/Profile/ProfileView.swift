//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List {
            Section {
                Button(action: {}) {
                    HStack {
                        Text("Currency")
                        Spacer()
                        Text(viewModel.currency?.symbol ?? "")
                    }
                }
                .buttonStyle(CustomButtonStyle())
                
            } header: {
                Text("Settings")
            }
            .listRowBackground(Color.white.opacity(0.2))
            .listRowSeparator(.hidden)
            
            Section {
                Text("Export to CSV")
                Text("Clear all data")
            } header: {
                Text("Data")
            }
            .listRowBackground(Color.white.opacity(0.2))
            .listRowSeparatorTint(.white)
        }
        .listStyle(.insetGrouped)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            viewModel: .init(
                preferences: MockPreferences()
            )
        )
            .background(Color.blue)
    }
}
