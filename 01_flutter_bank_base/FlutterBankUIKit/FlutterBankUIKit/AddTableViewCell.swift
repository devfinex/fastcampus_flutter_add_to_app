//
//  AddTableViewCell.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 1/28/24.
//

import UIKit

class AddTableViewCell: UITableViewCell {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let label = UILabel()
    label.text = "+"
    label.textColor = UIColor(white: 139.0 / 255.0, alpha: 1)
    addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    backgroundColor = UIColor.white
    layer.cornerRadius = 20
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
