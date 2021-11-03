//
//  Created by Maciej Górecki on 09/10/2021
//

import SwiftUI

private struct DependencyManagerKey: EnvironmentKey {
  static let defaultValue = DependencyManager(inMemory: true)
}

extension EnvironmentValues {
    var dependencies: DependencyManager {
      get { self[DependencyManagerKey.self] }
      set { self[DependencyManagerKey.self] = newValue }
    }
}
