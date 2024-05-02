//
//  FlutterBankSwiftUIApp.swift
//  FlutterBankSwiftUI
//
//  Created by sjkim on 1/28/24.
//

import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate, ObservableObject {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    return true
  }
}

@main
struct FlutterBankSwiftUIApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
