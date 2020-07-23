import SwiftUI
import WebKit

struct Tab: View {
    @State private var text = ""

    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "eyeglasses")
                    .font(Font.largeTitle.bold())
                Text("Title")
                    .font(.headline)
            }.foregroundColor(.init(.quaternaryLabel))
            Web(url: $text)
                .edgesIgnoringSafeArea(.all)
                .opacity(text.isEmpty ? 0 : 1)
            Tools(search: search)
        }
    }
    
    private func search(_ text: String) {
        self.text = text
    }
}

private struct Web: UIViewRepresentable {
    @Binding var url: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        context.coordinator.prepare(view)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let url = self.url.contains("http") ? self.url : "http://" + self.url
        _ = URL(string: url).map { uiView.load(.init(url: $0)) }
    }
}

private final class Coordinator: NSObject, WKNavigationDelegate {
    var view: Web?
    private var observations = Set<NSKeyValueObservation>()
    
    deinit {
        observations.forEach { $0.invalidate() }
    }
    
    func prepare(_ webView: WKWebView) {
        webView.navigationDelegate = self
        
//        observations.insert(webView.observe(\.estimatedProgress, options: .new) { [weak self] in
//            $1.newValue.map { progress in
//                DispatchQueue.main.async {
//                    self?.contentView?.progress = .init(progress)
//                }
//            }
//        })
    }
    
    func webView(_ webView: WKWebView, didFinish: WKNavigation!) {
//        contentView?.progress = 1
//        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { [weak self] in
//            guard let report = self?.safer.analyse($0) else { return }
//            self?.contentView?.report = report
//        }
    }
}
