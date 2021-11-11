//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct EntryDateView: View {
    let date: EntryDate
    let isSelected: Bool
    
    init(_ date: EntryDate, isSelected: Bool) {
        self.date = date
        self.isSelected = isSelected
    }
    
    var body: some View {
        VStack {
            Text(String.twoDigited(date.month.value))
                .font(.title3)
                .bold()
            Text(date.month.symbol.prefix(3))
                .textCase(.uppercase)
                .font(.footnote)
            
            Rectangle()
                .fill(Color.gray.opacity(0.7))
                .frame(width: 2, height: 12)
            
            Text(String(date.year.value))
                .font(.caption)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 22)
        .background(background)
        .cornerRadius(12)
    }
}

private extension EntryDateView {
    @ViewBuilder
    var background: some View {
        if isSelected {
            selectedBackground
        } else {
            unselectedBackground
        }
    }
    
    var selectedBackground: some View {
        LinearGradient(
            gradient: Gradient(colors: [.gradient1,.gradient2, .gradient2]),
            startPoint: .top,
            endPoint: .bottom
        )
            .overlay(
                Color.clear
                    .background(.thickMaterial)
                    .cornerRadius(12)
                    .padding(2)
            )
            .mask(
                LinearGradient(
                    colors: [
                        .black,
                        .black,
                        .black,
                        .black.opacity(0.5),
                        .black.opacity(0.1),
                        .clear
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
    
    var unselectedBackground: some View {
        Color.secondaryColor
    }
}

struct EntryDateView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            EntryDateView(
                .init(month: .january, year: .init(2020)!),
                isSelected: true
            )
            EntryDateView(
                .init(month: .january, year: .init(2020)!),
                isSelected: false
            )
        }
            .padding()
            .background(Color.background)
            .environment(\.colorScheme, .dark)
            .previewLayout(.sizeThatFits)
    }
}
