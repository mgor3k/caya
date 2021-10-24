//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct Credit: Identifiable {
    let id = UUID()
    let value: LocalizedStringKey
}

struct CreditsView: View {
    private let credits: [Credit] = [
        .init(value: "App Icon\n[Made by Ctrlastudio](https://www.flaticon.com/authors/ctrlastudio)")
    ]
    
    var body: some View {
        ZStack {
            GradientBackgroundView(position: .trailing)
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(credits) { credit in
                        Text(credit.value)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(Padding.screenEdge)
        }
        .navigationTitle("Credits")
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
