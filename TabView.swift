import SwiftUI

struct TabView: View {

    var body: some View {
        ZStack {
            Text(.init("New.tab"))
                .font(.headline)
                .foregroundColor(.secondary)
            Bar()
        }
    }
}
