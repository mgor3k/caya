//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct AddEntryScene: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .leading, spacing: 32) {
                Text("**New** entry")
                    .font(.title2)
                    .padding(.horizontal, 24)
                
                EntryDatePicker(
                    viewModel: .init()
                )
                
                Spacer()
            }
            .padding(.top, 48)
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
