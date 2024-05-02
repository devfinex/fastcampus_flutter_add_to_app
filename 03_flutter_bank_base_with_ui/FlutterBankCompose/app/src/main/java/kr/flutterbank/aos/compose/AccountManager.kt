package kr.flutterbank.aos.compose

import androidx.compose.runtime.mutableStateListOf

object AccountManager {
  val accounts = mutableStateListOf<Account>()

  init {
    accounts.addAll(
      arrayListOf(Account("10011"), Account("20012"))
    )
  }

  fun checkAccountNoValid(accountNo: String): Boolean {
    return accountNo.isNotBlank() && !accounts.map { it.no }
      .contains(accountNo)
  }

  fun makeAccount(accountNo: String): Boolean {
    accounts.add(Account(accountNo))
    return true
  }
}