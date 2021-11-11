//
//  Created by Maciej Górecki on 24/10/2021
//

import SwiftUI

struct CreditsView: View {
    @StateObject var store: CreditsStore
    
    var body: some View {
        ZStack {
            GradientBackgroundView(position: .trailing)
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(store.credits) { credit in
                        Text(credit.value)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(Padding.screenEdge)
        }
        .navigationTitle("Credits")
        .task {
            await store.fetch()
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView(
            store: .init(
                repository: PreviewCreditsRepository(
                    credits: [
                        .init(value: "Fist"),
                        .init(value: "Second\n[link](www.google.com)")
                    ]
                )
            )
        )
    }
}
