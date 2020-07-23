import SwiftUI

struct Bar: View {
    @Binding var text: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 260, height: 40)
                .foregroundColor(.init(.secondarySystemBackground))
            HStack {
                Spacer()
                TextField(.init("Bar"), text: $text, onCommit: action)
                    .textContentType(.URL)
                    .keyboardType(.webSearch)
                    .autocapitalization(.none)
                    .multilineTextAlignment(.center)
                    .disableAutocorrection(true)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: 220, height: 40)
                Spacer()
            }
        }
    }
}
