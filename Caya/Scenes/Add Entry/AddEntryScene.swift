//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct AddEntryScene: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 48) {
                Text("September 2021")
                    .font(.title)
                    .bold()
                
                VStack {
                    KeyValueView(key: "Income", value: "?")
                    KeyValueView(key: "Expenses", value: "?")
                    ForEach(viewModel.taxes, id: \.self) { tax in
                        KeyValueView(key: tax, value: "?")
                    }
                }
                
                Spacer()
            }
            .padding(24)
        }
    }
}

struct AddEntryScene_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryScene(
            viewModel: .init(taxManager: MockTaxManager())
        )
            .environment(\.colorScheme, .dark)
    }
}
