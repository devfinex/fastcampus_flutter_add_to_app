//
//  PasswordViewController.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 5/19/24.
//

import UIKit
import flutter_boost

class PasswordViewController: UIViewController {
  private let accountNo: String
  
  init(accountNo: String) {
    self.accountNo = accountNo
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white
    
    let titleLabel = UILabel()
    titleLabel.text = "비밀번호 입력"
    view.addSubview(titleLabel)
    
    let button = UIButton(type: .system)
    button.setTitle("확인", for: .normal)
    button.addTarget(self, action: #selector(touchButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    
    let guide = view.safeAreaLayoutGuide
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true

    button.translatesAutoresizingMaskIntoConstraints = false
    button.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40).isActive = true
    button.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -40).isActive = true
    button.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
  }
  
  @objc func touchButton(_ sender: UIButton) {
    dismiss(animated: true) {
      FlutterBoost.instance().sendEventToFlutter(with: "info", arguments: ["password": "1111"])
    }
  }
}
