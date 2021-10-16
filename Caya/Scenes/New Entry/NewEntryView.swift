//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct NewEntryView: View {
    @StateObject var viewModel: NewEntryViewModel
    @FocusState var focus: Int?
    
    var isFocused: Bool {
        focus != nil
    }
    
    var body: some View {
        // Disable keyboard avoidance
        GeometryReader { _ in
            content
        }
    }
    
    var content: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .leading, spacing: 32) {
                Text("**New** entry")
                    .font(.title2)
                    .padding(.horizontal, 24)
                
                if !isFocused {
                    EntryDatePicker(
                        viewModel: .init()
                    )
                }
                
                VStack {
                    field(title: "Income", id: 0, value: $viewModel.income)
                    field(title: "Expenses", id: 1, value: $viewModel.expenses)
                }
                .padding(.horizontal, 24)
                
                Spacer()
                VStack {
                    if isFocused {
                        Button(action: clearFocus) {
                            Text("Done")
                                .padding(.horizontal, 48)
                                .padding(.vertical, 16)
                                .background(Color.white)
                                .cornerRadius(16)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 24)
                    }
                }
                .animation(.default, value: focus)
            }
            .padding(.top, 48)
            .animation(.default, value: focus)
        }
    }
}

private extension NewEntryView {
    @ViewBuilder
    func field(title: String, id: Int, value: Binding<Double?>) -> some View {
        if !isFocused || focus == id {
            Button(action: { focus = id }) {
                MoneyInputTextField(
                    title: title,
                    currency: viewModel.currency,
                    value: value
                )
                    .focused($focus, equals: id)
            }
            .buttonStyle(CustomButtonStyle(isEnabled: focus != id))
        }
    }
    
    func clearFocus() {
        focus = nil
    }
}

struct AddEntryScene_Previews: PreviewProvider {
    static var previews: some View {
        NewEntryView(
            viewModel: .init()
        )
            .environment(\.colorScheme, .dark)
    }
}
