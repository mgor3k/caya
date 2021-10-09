//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

struct SavingsSectionView: View {
    let savings: Double
    let onAdd: () -> Void
    
    var body: some View {
        HStack {
            Text(NumberFormatter.currency(from: savings))
                .font(.title)
                .bold()
            
            Spacer()
            
            Button(action: onAdd) {
                Image(systemName: "plus")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color(uiColor: .label).opacity(0.5), lineWidth: 1)
                )
            }
            .foregroundColor(Color(uiColor: .label))
        }
    }
}

struct SavingsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsSectionView(
            savings: 500,
            onAdd: {}
        )
            .previewLayout(.sizeThatFits)
    }
}
