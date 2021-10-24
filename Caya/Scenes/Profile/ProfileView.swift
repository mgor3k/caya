//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    let onRoute: (ProfileRoute) -> Void
    
    init(viewModel: ProfileViewModel, onRoute: @escaping (ProfileRoute) -> Void) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.onRoute = onRoute
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
            
            Section {
                Button(action: { onRoute(.credits) }) {
                    HStack {
                        Text("Credits")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                }
                .buttonStyle(CustomButtonStyle())
                
            } header: {
                Text("Other")
            }
            .listRowBackground(Color.white.opacity(0.2))
            .listRowSeparator(.hidden)
        }
        .listStyle(.insetGrouped)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            viewModel: .init(
                preferences: MockPreferences()
            ),
            onRoute: { _ in }
        )
            .background(Color.blue)
    }
}
