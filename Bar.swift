import SwiftUI

struct Bar: View {
//    @State private var text = ""
    @State private var hide = true
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if hide {
                    Blob.Icon(icon: "magnifyingglass", action: show)
                        .padding()
                    Spacer()
                } else {
                    Blob.Icon(icon: "multiply", action: show)
                        .padding()
                    Blob.Icon(icon: "square.on.square", action: show)
                        .padding()
                    Blob.Icon(icon: "line.horizontal.3", action: show)
                        .padding()
                }
            }
        }
    }
    
    private func show() {
        withAnimation {
            hide.toggle()
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
