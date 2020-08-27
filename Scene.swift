import SwiftUI

final class Scene: NSObject, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo: UISceneSession, options: UIScene.ConnectionOptions) {
        window = .init(windowScene: scene as! UIWindowScene)
        window!.rootViewController = UIHostingController(rootView: Tab())
        window!.rootViewController!.view.backgroundColor = .secondarySystemBackground
        window!.backgroundColor = .secondarySystemBackground
        window!.makeKeyAndVisible()
    }
}
