//
//  NewAccountViewController.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 4/28/24.
//

import UIKit
import Flutter

class NewAccountViewController: UIViewController {
  let flutterEngine: FlutterEngine
  
  init() {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    flutterEngine = appDelegate.flutterEngineGroup.makeEngine(withEntrypoint: "main", libraryURI: nil, initialRoute: nil)
    flutterEngine.run()
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
