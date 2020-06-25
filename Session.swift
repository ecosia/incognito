import SwiftUI

final class Session: ObservableObject {
    @Published var barOffset = CGFloat()
    
    var keyboardHeight = CGFloat() {
        didSet {
             barOffset += oldValue - keyboardHeight
        }
    }
    
    let barHeight = CGFloat(100)
    
    func offset(_ height: CGFloat, insets: CGFloat) {
        barOffset = height - insets - barHeight - keyboardHeight
    }
}
