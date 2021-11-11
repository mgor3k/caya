//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct ProfileView: View {
    @StateObject var store: ProfileStore
    
    let onCredits: () -> Void
    
    var body: some View {
        List {
            Section {
                Button(action: {}) {
                    HStack {
                        Text("Currency")
                        Spacer()
                        Text(store.currency?.symbol ?? "")
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
                Button(action: onCredits) {
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
        .navigationTitle("Profile")
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            store: .init(
                preferences: MockPreferences()
            ),
            onCredits: {}
        )
            .background(Color.blue)
    }
}
