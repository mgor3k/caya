//
//  Created by Maciej Górecki on 17/10/2021
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    @State var text = ""
    
    let onCompleted: () -> Void
    
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: .bottom
            )
            
            GeometryReader { proxy in
                TabView {
                    page1(proxy: proxy).tag(0)
                    page2.tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .foregroundColor(.white)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

extension OnboardingView {
    func page1(proxy: GeometryProxy) -> some View {
        VStack(spacing: 24) {
            // TODO: Add image
            Image("Project")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: proxy.size.height / 2)
            
            Text("Get inspired")
                .font(.title)
                .tracking(2)
            
            Text("Something something")
            
            Spacer()
        }
        .padding(Padding.screenEdge)
    }
    
    var page2: some View {
        VStack(spacing: 24) {
            Text("Pick your currency")
                .font(.title)
                .tracking(2)
            
            Text("Something something")
                        
            TextField("Tap to search", text: $text)
                .padding()
                .background(Color.background)
                .cornerRadius(12)
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
            
            Picker("Pick your currency", selection: $viewModel.selection) {
                ForEach(Locale.isoCurrencyCodes, id: \.self) { code in
                    let string = Locale.current.localizedString(forCurrencyCode: code) ?? ""
                    if text.isEmpty || string.contains(text) {
                        Text(string)
                            .foregroundColor(.white)
                    }
                }
            }
            .pickerStyle(.wheel)
            
            Button(action: onSaved) {
                Text("Done")
                    .padding()
                    .background(Color.background)
            }
            
            Spacer()
        }
        .padding(Padding.screenEdge)
        .padding(.top, 32)
    }
    
    func onSaved() {
        viewModel.storeSelection()
        onCompleted()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            viewModel: .init(preferences: MockPreferences()),
            onCompleted: {}
        )
            .environment(\.colorScheme, .dark)
    }
}
