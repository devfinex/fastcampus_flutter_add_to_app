//
//  FlutterBankSwiftUIApp.swift
//  FlutterBankSwiftUI
//
//  Created by sjkim on 1/28/24.
//

import SwiftUI
import Flutter

class AppDelegate: UIResponder, UIApplicationDelegate, ObservableObject {
  let flutterEngineGroup = FlutterEngineGroup(name: "engine group", project: nil)

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
