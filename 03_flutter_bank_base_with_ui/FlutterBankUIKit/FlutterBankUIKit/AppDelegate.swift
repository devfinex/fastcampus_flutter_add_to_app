//
//  AppDelegate.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 1/28/24.
//

import UIKit
import Flutter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  let flutterEngineGroup = FlutterEngineGroup(name: "engine group", project: nil)

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  // MARK: UISceneSession Lifecycle
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
  }
}
