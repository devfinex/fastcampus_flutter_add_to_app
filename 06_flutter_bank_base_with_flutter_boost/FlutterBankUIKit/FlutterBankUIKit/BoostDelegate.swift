//
//  BoostDelegate.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 5/19/24.
//

import flutter_boost
import Flutter
import FlutterPluginRegistrant

class BoostDelegate: NSObject, FlutterBoostDelegate {
  private let window: UIWindow
  var navigationController:UINavigationController?
  var resultTable:Dictionary<String,([AnyHashable:Any]?) -> Void> = [:]

  init(window: UIWindow) {
    self.window = window
    super.init()
  }

  func engine() -> FlutterEngine {
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.flutterEngineGroup
      .makeEngine(withEntrypoint: "main", libraryURI: nil, initialRoute: nil)
  }

  func pushNativeRoute(_ pageName: String!, arguments: [AnyHashable : Any]!) {
    let isPresent = arguments["isPresent"] as? Bool ?? false
    let isAnimated = arguments["isAnimated"] as? Bool ?? true
    let targetViewController: UIViewController
    
    if pageName == "password" {
      let accountNo = arguments["accountNo"] as? String ?? ""
      targetViewController = PasswordViewController(accountNo: accountNo)
      if let sheet = targetViewController.sheetPresentationController {
        sheet.detents = [.medium()]
      }
    } else {
      targetViewController = UIViewController()
    }
    
    if (isPresent){
      self.navigationController?.present(targetViewController, animated: isAnimated, completion: nil)
    } else {
      self.navigationController?.pushViewController(targetViewController, animated: isAnimated)
    }
  }
  
  func pushFlutterRoute(_ options: FlutterBoostRouteOptions!) {
    let vc: FBFlutterViewContainer = NewAccountViewController()
    vc.setName(options.pageName, uniqueId: options.uniqueId, params: options.arguments,opaque: options.opaque)
    
    let isPresent = (options.arguments?["isPresent"] as? Bool)  ?? false
    let isAnimated = (options.arguments?["isAnimated"] as? Bool) ?? true
    
    resultTable[options.pageName] = options.onPageFinished;
    
    if(isPresent || !options.opaque){
      navigationController?.present(vc, animated: isAnimated, completion: nil)
    } else {
      navigationController?.pushViewController(vc, animated: isAnimated)
    }
  }
  
  func popRoute(_ options: FlutterBoostRouteOptions!) {
    if let vc = self.navigationController?.presentedViewController as? FBFlutterViewContainer,vc.uniqueIDString() == options.uniqueId{
      if vc.modalPresentationStyle == .overFullScreen {
        self.navigationController?.topViewController?.beginAppearanceTransition(true, animated: false)
        
        vc.dismiss(animated: true) {
          self.navigationController?.topViewController?.endAppearanceTransition()
        }
      } else {
        vc.dismiss(animated: true, completion: nil)
      }
    } else {
      self.navigationController?.popViewController(animated: true)
    }

    if let onPageFinshed = resultTable[options.pageName] {
      onPageFinshed(options.arguments)
      resultTable.removeValue(forKey: options.pageName)
    }
  }
}
