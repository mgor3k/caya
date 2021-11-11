//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct ProfileView: View {
    @StateObject var store: ProfileStore
    
    let onTaxes: () -> Void
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
                
                DisclosureButton("Taxes", action: onTaxes)
                
            } header: {
                Text("Settings")
            }
            .listRowBackground(Color.white.opacity(0.2))
            .listRowSeparatorTint(.white)
            
            Section {
                Text("Clear all data")
            } header: {
                Text("Data")
            }
            .listRowBackground(Color.white.opacity(0.2))
            .listRowSeparatorTint(.white)
            
            Section {
                DisclosureButton("Credits", action: onCredits)
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
            onTaxes: {},
            onCredits: {}
        )
            .background(Color.blue)
    }
}
