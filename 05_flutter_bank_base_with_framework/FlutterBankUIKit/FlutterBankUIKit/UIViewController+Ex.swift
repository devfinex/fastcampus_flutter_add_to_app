//
//  UIViewController+Ex.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 2/11/24.
//

import UIKit
import SnapKit

extension UIViewController {
  @objc func add(childViewController viewController: UIViewController) {
    addChild(viewController)
    viewController.view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(viewController.view)
    viewController.view.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
    viewController.didMove(toParent: self)
  }
  
  @objc func remove(childViewController viewController: UIViewController) {
    if self.children.count > 0{
      let viewControllers:[UIViewController] = self.children
      
      if (viewControllers.contains(viewController)) {
        viewController.willMove(toParent: nil)
        viewController.removeFromParent()
        viewController.view.removeFromSuperview()
      }
    }
  }
    
  @objc func update(childViewController: UIViewController, bottom: CGFloat) {
      if let flutterView = childViewController.view {
        flutterView.snp.updateConstraints { make in
          make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(bottom * -1)
        }
        flutterView.layoutIfNeeded()
      }
  }
}
