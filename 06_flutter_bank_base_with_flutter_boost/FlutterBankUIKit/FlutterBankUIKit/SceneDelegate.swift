//
//  SceneDelegate.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 1/28/24.
//

import UIKit
import flutter_boost

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    let navigationController = UINavigationController(rootViewController: HomeViewController())
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    self.window = window
    
    let delegate = BoostDelegate(window: window)
    delegate.navigationController = navigationController
    FlutterBoost.instance().setup(UIApplication.shared, delegate: delegate) { engine in
    }
  }

  func sceneDidDisconnect(_ scene: UIScene) {
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
  }

  func sceneWillResignActive(_ scene: UIScene) {
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
  }
}
