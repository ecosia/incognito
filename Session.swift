import SwiftUI

final class Session: ObservableObject {
    @Published var barOffset = CGFloat()
    let barHeight = CGFloat(100)
    
    func offset(_ height: CGFloat, insets: CGFloat) {
        barOffset = height - insets - barHeight
    }
}
