import SwiftUI

struct Tab: View {

    var body: some View {
        ZStack {
            Text(.init("New.tab"))
                .font(.headline)
                .foregroundColor(.secondary)
            Tools()
        }
    }
}
