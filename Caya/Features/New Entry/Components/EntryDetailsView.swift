//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct NewEntryView: View {
    @StateObject var store: EntryDetailsStore
    
    @FocusState private var focus: String?
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
                .onTapGesture {
                    focus = nil
                }
            
            VStack(alignment: .leading, spacing: 0) {
                navigationBar
                
                EntryDatePicker(
                    date: $store.date,
                    disabledEntries: store.disabledDates,
                    isDisabled: store.isEditing
                )
                    .disabled(store.isEditing)
                    .opacity(store.isEditing ? 0.5 : 1)
                
                list
            }
            .padding(.top, 32)
            .animation(.default, value: focus)
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
        }
//        .safeAreaInset(edge: .bottom) {
//            // Add keyboard bar
//            Color.blue.frame(height: 20)
//        }
    }
}

private extension NewEntryView {
    var navigationBar: some View {
        HStack {
            Text("**\(store.isEditing ? "Editing" : "New")** entry")
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
        .padding(.horizontal, 24)
    }
    
    var list: some View {
        List(store.sections, id: \.title) { section in
            Section {
                ForEach(section.rows, id: \.title) { row in
                    MoneyInputTextField(
                        title: row.title,
                        currencySymbol: store.currency.symbol,
                        value: Binding<Double?>(
                            get: { row.value },
                            set: { row.value = $0 ?? 0 }
                        )
                    )
                        .focused($focus, equals: row.id)
                        .onTapGesture {
                            focus = row.id
                        }
                }
            } header: {
                Text(section.title)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .bold()
            }
        }
        .listStyle(.sidebar)
    }
    
    func clearFocus() {
        focus = nil
    }
    
    func save() {
        store.save()
        presentation.wrappedValue.dismiss()
    }
}

struct AddEntryScene_Previews: PreviewProvider {
    static var previews: some View {
        NewEntryView(
            store: .init(
                NewEntryController(
                    preferences: MockPreferences(),
                    repository: PreviewEntryRepository()
                )
            )
        )
            .environment(\.colorScheme, .dark)
    }
}
