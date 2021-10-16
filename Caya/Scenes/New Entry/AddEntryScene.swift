//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct AddEntryScene: View {
    @StateObject var viewModel: AddEntryViewModel
    @FocusState var focus: Int?
    
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
                            Button(action: { focus = focus == nil ? 1 : nil }) {
                                TitledMoneyLabel(
                                    title: "Income",
                                    currency: "$",
                                    value: 4000
                                )
                                    .focused($focus, equals: 1)
                            }
                        }
                        if focus == nil || focus == 2 {
                            Button(action: { focus = focus == nil ? 2 : nil }) {
                                TitledMoneyLabel(
                                    title: "Income",
                                    currency: "$",
                                    value: 5000
                                )
                                    .focused($focus, equals: 2)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                
                Button(action: onSave) {
                    Text("Save")
                }
                .background(Color.white)
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding(.top, 48)
            .animation(.default, value: focus)
        }
        .ignoresSafeArea(.keyboard)
    }
}

private extension AddEntryScene {
    func onSave() {
        // TODO: Save action
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
