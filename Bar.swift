import SwiftUI

struct Bar: View {
    @State private var text = ""
    
    var body: some View {
        Blob.Icon(icon: "plus", action: commit)
    }
    
//    var body: some View {
//        TextField(.init("Bar"), text: $text, onCommit: commit)
//            .textContentType(.URL)
//            .keyboardType(.URL)
//            .autocapitalization(.none)
//            .disableAutocorrection(true)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding(.top, session.barOffset)
//    }
    
    private func commit() {
        
    }
}
