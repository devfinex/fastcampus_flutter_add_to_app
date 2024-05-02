import SwiftUI

class AccountManager: ObservableObject {
  static let shared = AccountManager()
  
  @Published var accounts: [Account] = [
    Account(no: "10011"),
    Account(no: "20012")
  ]
  
  func checkAccountNoValid(_ accountNo: String) -> Bool {
    if !accountNo.isEmpty && !accounts.map({ $0.no }).contains(accountNo) {
      return true
    }
    return false
  }
  
  func addAccount(_ accountNo: String) -> Bool {
    accounts.append(Account(no: accountNo))    
    return true
  }
}

