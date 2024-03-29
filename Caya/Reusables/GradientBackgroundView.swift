//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct GradientBackgroundView: View {
    let position: Position
    
    var body: some View {
        ZStack {
            Color.background
            
            VStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                .gradient1,
                                .gradient1,
                                .gradient1,
                                .gradient2,
                                .gradient2
                            ],
                            startPoint: position.startPoint,
                            endPoint: position.endPoint
                        )
                    )
                    .frame(width: 300, height: 300)
                    .drawingGroup()
                    .blur(radius: 80)
                    .offset(position.offset)
                
                Spacer()
            }
            .opacity(0.5)
        }
        .ignoresSafeArea()
    }
}

extension GradientBackgroundView {
    enum Position {
        case top
        case leading
        case trailing
        case bottom
        case center
        
        var startPoint: UnitPoint {
            switch self {
            case .top, .bottom, .center:
                return .leading
            case .leading, .trailing:
                return .top
            }
        }
        
        var endPoint: UnitPoint {
            switch self {
            case .top, .bottom, .center:
                return .trailing
            case .leading, .trailing:
                return .bottom
            }
        }
        
        // TODO: This needs to be dynamic
        // To look good for all devices
        var offset: CGSize {
            switch self {
            case .top:
                return .init(width: 0, height: -220)
            case .leading:
                return .init(width: -220, height: 0)
            case .bottom:
                return .init(width: 0, height: 700)
            case .trailing:
                return .init(width: 220, height: 0)
            case .center:
                return .init(width: 0, height: 100)
            }
        }
    }
}

struct GradientBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView(position: .center)
    }
}
