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
        }
        .ignoresSafeArea()
    }
}

extension GradientBackgroundView {
    enum Position {
        case top
        case leading
        
        var startPoint: UnitPoint {
            switch self {
            case .top:
                return .leading
            case .leading:
                return .top
            }
        }
        
        var endPoint: UnitPoint {
            switch self {
            case .top:
                return .trailing
            case .leading:
                return .bottom
            }
        }
        
        var offset: CGSize {
            switch self {
            case .top:
                return .init(width: 0, height: -220)
            case .leading:
                return .init(width: -220, height: 0)
            }
        }
    }
}

struct GradientBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView(position: .leading)
    }
}
