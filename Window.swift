import SwiftUI
import Combine

final class Window: UIWindow {
    private var subs = Set<AnyCancellable>()
    
    required init?(coder: NSCoder) { nil }
    override init(windowScene: UIWindowScene) {
        super.init(windowScene: windowScene)
        
        let session = Session()
        session.offset(frame.height, insets: safeAreaInsets.bottom)
        rootViewController = UIHostingController(rootView: TabView().environmentObject(session))

        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification).sink { [weak self] _ in
            guard let self = self else { return }
            session.offset(self.frame.height, insets: self.safeAreaInsets.bottom)
        }.store(in: &subs)
    }
}
