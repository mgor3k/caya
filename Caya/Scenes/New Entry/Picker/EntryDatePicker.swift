//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct EntryDatePicker: View {
    @Binding private var selectedDate: EntryDate
    private let entries: [EntryDate]
    private let disabledEntries: [EntryDate]
    
    init(
        date: Binding<EntryDate>,
        disabledEntries: [EntryDate]
    ) {
        self._selectedDate = date
        self.disabledEntries = disabledEntries
        
        let components = Calendar.current.dateComponents([.year, .month], from: .now)
        let currentYear = components.year!
        let currentMonth = components.month!
        
        let years = Array(currentYear-1...currentYear)
        
        let current = years.compactMap(Year.init)
            .flatMap { year in
                (1...(year.value == currentYear ? currentMonth : 12)).compactMap(Month.init).compactMap { EntryDate(month: $0, year: year) }
            }
        
        entries = current.reversed()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select a date")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { reader in
                    LazyHStack(spacing: 12) {
                        ForEach(entries, id: \.self) { date in
                            Button(action: { selectedDate = date }) {
                                EntryDateView(
                                    date,
                                    isSelected: selectedDate == date
                                )
                            }
                            .buttonStyle(CustomButtonStyle())
                            .disabled(disabledEntries.contains(date))
                            .opacity(disabledEntries.contains(date) ? 0.1 : 1)
                        }
                        .onAppear {
                            reader.scrollTo(selectedDate, anchor: .center)
                        }
                    }
                    .padding(.horizontal, 24)
                }
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
                date: .constant(.init(month: .january, year: .init(2021)!)),
                disabledEntries: []
            )
        }
            .environment(\.colorScheme, .dark)
    }
}
