import SwiftUI
import WebKit

struct Tab: View {
    @State private var text = ""
    @State private var progress = CGFloat(1)

    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "eyeglasses")
                    .font(Font.largeTitle.bold())
                Text("Title")
                    .font(.headline)
            }.foregroundColor(.init(.quaternaryLabel))
            
            VStack {
                Progress(progress: progress)
                    .stroke(progress < 1 ? Color.pink : .clear,
                            style: .init(lineWidth: 4, lineCap: .round))
                    .frame(height: 4)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                Web(url: $text, progress: $progress)
                    .opacity(text.isEmpty ? 0 : 1)
            }
            Tools(search: search)
        }
    }
    
    private func search(_ text: String) {
        self.text = text
    }
}

private struct Web: UIViewRepresentable {
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

private final class Coordinator: WKWebView, WKNavigationDelegate {
    var last = "" {
        didSet {
            let url = last.contains("http") ? last : "http://" + last
            _ = URL(string: url).map { load(.init(url: $0)) }
        }
    }
    private var observations = Set<NSKeyValueObservation>()
    private let view: Web
    
    required init?(coder: NSCoder) { nil }
    init(view: Web) {
        self.view = view
        super.init(frame: .zero, configuration: .init())
        navigationDelegate = self
        observations.insert(observe(\.estimatedProgress, options: .new) { [weak self] in
            $1.newValue.map { progress in
                DispatchQueue.main.async {
                    self?.view.progress = .init(progress)
                }
            }
        })
    }
    
    deinit {
        observations.forEach { $0.invalidate() }
    }
    
    func webView(_: WKWebView, didFinish: WKNavigation!) {
        view.progress = 1
    }
}
