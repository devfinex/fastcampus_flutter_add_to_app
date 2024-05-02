//
//  HomeViewController.swift
//  FlutterBankUIKit
//
//  Created by sjkim on 1/28/24.
//

import UIKit

struct Account {
  let no: String
}

class HomeViewController: UIViewController {
  let tableView = UITableView()
  private var accounts: [Account] {
    return AccountManager.shared.accounts
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: "AccountTableViewCell")
    tableView.register(AddTableViewCell.self, forCellReuseIdentifier: "AddTableViewCell")
    view.addSubview(tableView)
    
    let guide = view.safeAreaLayoutGuide
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
    tableView.separatorStyle = .none
    
    view.backgroundColor = UIColor(white: 247.0 / 255.0, alpha: 1)
    tableView.backgroundColor = UIColor(white: 247.0 / 255.0, alpha: 1)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return accounts.count + 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row < accounts.count {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as? AccountTableViewCell {
        let account = accounts[indexPath.row]
        cell.account = account
        cell.selectionStyle = .none
        return cell
      }
    } else {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "AddTableViewCell", for: indexPath) as? AddTableViewCell {
        cell.selectionStyle = .none
        return cell
      }
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == accounts.count {
      let viewController = NewAccountViewController()
      navigationController?.pushViewController(viewController, animated: true)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == accounts.count {
      return 50
    } else {
      return 100
    }
  }
}
