//
//  AccountTableViewCell.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 1/28/24.
//

import UIKit

final class AccountTableViewCell: UITableViewCell {
  var account: Account? {
    didSet {
      nameLabel.text = "계좌번호"
      numberLabel.text = account?.no
    }
  }
  
  let nameLabel = UILabel()
  let numberLabel = UILabel()
  let spacer = UIView()
  let stackView = UIStackView()
    
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor.clear
    
    addSubview(stackView)
    stackView.axis = .horizontal
    stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.backgroundColor = UIColor(red: 88.0 / 255.0, green: 103.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
    stackView.layer.cornerRadius = 20

    stackView.addArrangedSubview(nameLabel)
    stackView.addArrangedSubview(spacer)
    stackView.addArrangedSubview(numberLabel)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    
    nameLabel.textColor = UIColor.white
    numberLabel.textColor = UIColor.white
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    nameLabel.text = ""
    numberLabel.text = ""
  }
}
