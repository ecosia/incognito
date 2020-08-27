import SwiftUI
import WebKit

extension Web {
    final class Coordinator: WKWebView, WKNavigationDelegate {
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
            
            let configuration = WKWebViewConfiguration()
            configuration.allowsInlineMediaPlayback = true
            configuration.ignoresViewportScaleLimits = true
            configuration.dataDetectorTypes = [.link, .phoneNumber]
            configuration.defaultWebpagePreferences.preferredContentMode = .mobile
            configuration.websiteDataStore = .nonPersistent()
            
            super.init(frame: .zero, configuration: configuration)
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

}
