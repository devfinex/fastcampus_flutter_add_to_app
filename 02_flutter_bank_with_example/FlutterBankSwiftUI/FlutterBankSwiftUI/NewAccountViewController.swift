//
//  NewAccountViewController.swift
//  FlutterBankSwiftUI
//
//  Created by sjkim on 4/28/24.
//

import UIKit
import Flutter
import SwiftUI

struct NewAccountView: UIViewControllerRepresentable {
  @EnvironmentObject var appDelegate: AppDelegate

  func makeUIViewController(context: Context) -> NewAccountViewController {
    let flutterEngine = appDelegate.flutterEngineGroup.makeEngine(withEntrypoint: "main", libraryURI: nil, initialRoute: nil)
    flutterEngine.run()
    return NewAccountViewController(flutterEngine: flutterEngine)
  }
  
  func updateUIViewController(_ uiViewController: NewAccountViewController, context: Context) {
  }
  
  typealias UIViewControllerType = NewAccountViewController
}

class NewAccountViewController: UIViewController {
  let flutterEngine: FlutterEngine
  
  init(flutterEngine: FlutterEngine) {
    self.flutterEngine = flutterEngine
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white
    
    let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
    add(childViewController: flutterViewController)
  }
}
