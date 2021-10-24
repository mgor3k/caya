//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct ProfileView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Currency")
                    Spacer()
                    Text("$")
                }
            } header: {
                Text("Settings")
            }
            .listRowBackground(Color.white.opacity(0.2))
            .listRowSeparatorTint(.white)
            
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
        ProfileView()
            .background(Color.blue)
    }
}
