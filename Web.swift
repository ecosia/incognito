import SwiftUI
import WebKit

struct Web: UIViewRepresentable {
    @Binding var url: String
    @Binding var progress: CGFloat
    
    func makeCoordinator() -> Coordinator {
        .init(view: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        context.coordinator
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if context.coordinator.last != url {
            context.coordinator.last = url
        }
    }
}
