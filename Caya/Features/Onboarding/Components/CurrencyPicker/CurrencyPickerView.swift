//
//  Created by Maciej Gorecki on 12/11/2021
//

import SwiftUI

struct CurrencyPickerView: View {
    @StateObject var store: CurrencyPickerStore
    
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Pick your **currency**")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                                    
            TextField("Tap to search", text: $store.searchPhrase)
                .padding()
                .background(Color.background)
                .cornerRadius(12)
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
            
            Picker("Pick your currency", selection: $store.selection) {
                ForEach(store.currencies, id: \.self) { code in
                    let string = Locale.current.localizedString(forCurrencyCode: code) ?? ""
                    if store.searchPhrase.isEmpty || string.contains(store.searchPhrase) {
                        Text(string)
                            .foregroundColor(.white)
                    }
                }
            }
            .pickerStyle(.wheel)
            
            Button(action: onSave) {
                Text("Done")
                    .padding()
                    .background(Color.background)
            }
            
            Spacer()
        }
        .padding(24)
        .padding(.top, 32)
        .task {
            await store.fetch()
        }
    }
}

private extension CurrencyPickerView {
    func onSave() {
        Task {
            await store.storeSelection()
            onNext()
        }
    }
}

struct CurrencyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPickerView(
            store: .init(
                preferences: MockPreferences(),
                currencyRepository: PreviewCurrencyRepository()
            ),
            onNext: {}
        )
    }
}
