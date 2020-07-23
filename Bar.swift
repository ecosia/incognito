import SwiftUI

struct Bar: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Blob.Icon(icon: "magnifyingglass", action: commit)
                    .padding()
                Spacer()
            }
        }
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
