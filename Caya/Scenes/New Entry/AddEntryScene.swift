//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct AddEntryScene: View {
    @StateObject var viewModel: AddEntryViewModel
    @FocusState var focus: Int?
    
    @State var first: Double?
    @State var second: Double?
    
    var body: some View {
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
                
                if focus == nil {
                    EntryDatePicker(
                        viewModel: .init()
                    )
                }
                
                    VStack {
                        if focus == nil || focus == 1 {
                            Button(action: { focus = 1 }) {
                                TitledMoneyLabel(
                                    title: "Income",
                                    currency: "$",
                                    value: $first
                                )
                                    .focused($focus, equals: 1)
                            }
                            .buttonStyle(CustomButtonStyle(isEnabled: focus != 1))
                        }
                        if focus == nil || focus == 2 {
                            Button(action: { focus = 2 }) {
                                TitledMoneyLabel(
                                    title: "Income",
                                    currency: "$",
                                    value: $second
                                )
                                    .focused($focus, equals: 2)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                
                Spacer()
                VStack {
                    if focus != nil {
                        Button(action: onSave) {
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

private extension AddEntryScene {
    func onSave() {
        // TODO: Save action
        focus = nil
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
