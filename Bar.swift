import SwiftUI

struct Bar: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextField(.init("Bar"), text: $text, onCommit: commit)
                .textContentType(.URL)
                .keyboardType(.URL)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding(.top, 500)
    }
    
    private func commit() {
        
    }
}
