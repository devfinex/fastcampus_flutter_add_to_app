//
//  NewAccountViewController.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 4/28/24.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class NewAccountViewController: UIViewController {
  let flutterEngine: FlutterEngine
  var flutterChannel: FlutterMethodChannel?
  
  init() {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    flutterEngine = appDelegate.flutterEngineGroup.makeEngine(withEntrypoint: "main", libraryURI: nil, initialRoute: nil)
    GeneratedPluginRegistrant.register(with: flutterEngine)
    flutterEngine.run()
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white
    
    flutterChannel = FlutterMethodChannel(
          name: "flutter_bank", binaryMessenger: flutterEngine.binaryMessenger)
    flutterChannel?.setMethodCallHandler({ [weak self] call, result in
      switch call.method {
      case "pop":
        self?.navigationController?.popViewController(animated: true)

      case "checkAccount":
        if let accountNo = call.arguments as? String,
            let isValid = self?.checkAccountNoValid(accountNo), isValid {
          result(true)
        } else {
          result(false)
        }

      case "makeAccount":
        if let accountNo = call.arguments as? String,
            let isValid = self?.checkAccountNoValid(accountNo), isValid {
          if let r = self?.addAccount(accountNo) {
            result(r)
          }
        } else {
          result(false)
        }
        
      default:
        break
      }
    })
        
    let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
    add(childViewController: flutterViewController)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }

  func addAccount(_ accountNo: String) -> Bool {
    return AccountManager.shared.addAccount(accountNo)
  }

  func checkAccountNoValid(_ accountNo: String) -> Bool {
    return AccountManager.shared.checkAccountNoValid(accountNo)
  }
}
