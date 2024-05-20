//
//  NewAccountViewController.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 4/28/24.
//

import UIKit
import Flutter
import FlutterPluginRegistrant
import flutter_boost

class NewAccountViewController: FBFlutterViewContainer {
  var flutterChannel: FlutterMethodChannel?
  
  override init() {
    super.init()
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white
    
    flutterChannel = FlutterMethodChannel(
          name: "flutter_bank", 
          binaryMessenger: FlutterBoost.instance().engine().binaryMessenger
    )
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
