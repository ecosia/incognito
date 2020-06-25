import SwiftUI

struct TabView: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        ZStack {
            Bar()
            Text(.init("New.tab"))
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }
}
