//
//  ContentView.swift
//  FlutterBankSwiftUI
//
//  Created by sjkim on 1/28/24.
//

import SwiftUI

struct Account {
  let no: String
}

struct AccountView: View {
  let account: Account
  
  var body: some View {
    HStack {
      Text("계좌번호")
      Spacer()
      Text(account.no)
    }
    .foregroundStyle(.white)
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    .frame(maxWidth: .infinity, minHeight: 100)
    .listRowSeparator(.hidden)
  }
}

struct ContentView: View {
  @ObservedObject var accountManager = AccountManager.shared
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(accountManager.accounts, id: \.no) { account in
          AccountView(account: account)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .background(Color(UIColor(red: 88.0 / 255.0, green: 103.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)))
        }
        .listRowBackground(Color.clear)
        .cornerRadius(20)
        
        ZStack {
          NavigationLink(destination: NewAccountView()) {
            EmptyView()
          }
          Text("+")
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.white)
        }
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
        .cornerRadius(20)
      }
      .listStyle(.plain)
      .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
      .scrollContentBackground(.hidden)
      .background(Color(UIColor(white: 247.0 / 255.0, alpha: 1)))
    }
  }
}

#Preview {
  ContentView()
}
