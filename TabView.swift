import SwiftUI

struct TabView: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        ZStack {
            Text(.init("New.tab"))
                .font(.headline)
                .foregroundColor(.secondary)
            Bar().frame(height: session.barHeight)
        }
    }
}
