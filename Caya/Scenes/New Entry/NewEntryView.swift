//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct NewEntryView: View {
    @StateObject var viewModel: NewEntryViewModel
    @FocusState private var focus: Int?
    @Environment(\.presentationMode) private var presentation
    
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
            GradientBackgroundView(position: .top)
            
            VStack(alignment: .leading, spacing: 32) {
                HStack {
                    Text("**\(viewModel.isEditing ? "Editing" : "New")** entry")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button(action: save) {
                        HStack {
                            Image(systemName: "pencil")
                            Text("Save")
                                .bold()
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, Padding.screenEdge)
                
                if !isFocused {
                    EntryDatePicker(
                        date: $viewModel.date,
                        disabledEntries: viewModel.disabledDates,
                        isDisabled: viewModel.isEditing
                    )
                        .disabled(viewModel.isEditing)
                        .opacity(viewModel.isEditing ? 0.5 : 1)
                }
                
                VStack {
                    field(title: "Income", id: 0, value: $viewModel.income)
                    field(title: "Expenses", id: 1, value: $viewModel.expenses)
                }
                .padding(.horizontal, Padding.screenEdge)
                
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
            .padding(.top, 32)
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
                    currencySymbol: viewModel.currency.symbol,
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
    
    func save() {
        viewModel.save()
        presentation.wrappedValue.dismiss()
    }
}

struct AddEntryScene_Previews: PreviewProvider {
    static var previews: some View {
        NewEntryView(
            viewModel: .init(
                NewEntryController(
                    preferences: MockPreferences(),
                    service: MockPersistanceManager()
                )
            )
        )
            .environment(\.colorScheme, .dark)
    }
}
