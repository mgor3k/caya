//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct EntryDatePicker: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select a date")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(viewModel.entries, id: \.self) { date in
                        Button(action: { viewModel.selected = date }) {
                            EntryDateView(
                                date,
                                isSelected: viewModel.selected == date
                            )
                        }
                        .buttonStyle(CustomButtonStyle())
                        .disabled(viewModel.disabledEntries.contains(date))
                        .opacity(viewModel.disabledEntries.contains(date) ? 0.1 : 1)
                    }
                }
                .padding(.horizontal, 24)
            }
            .frame(height: 150)
        }
    }
}

struct EntryDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            EntryDatePicker(
                viewModel: .init()
            )
        }
            .environment(\.colorScheme, .dark)
    }
}
