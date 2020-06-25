import SwiftUI

struct Bar: View {
    @EnvironmentObject var session: Session
    @State private var text = ""
    
    var body: some View {
        TextField(.init("Bar"), text: $text, onCommit: commit)
            .textContentType(.URL)
            .keyboardType(.URL)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.top, session.barOffset)
    }
    
    private func commit() {
        
    }
}
