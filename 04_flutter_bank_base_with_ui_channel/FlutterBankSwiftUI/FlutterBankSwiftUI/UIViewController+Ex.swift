//
//  UIViewController+Ex.swift
//  FlutterBankSwiftUI
//
//  Created by sjkim on 2/12/24.
//

import UIKit
import SnapKit

extension UIViewController {
  func add(childViewController viewController: UIViewController) {
    addChild(viewController)
    viewController.view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(viewController.view)
    viewController.view.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
    viewController.didMove(toParent: self)
  }
}
