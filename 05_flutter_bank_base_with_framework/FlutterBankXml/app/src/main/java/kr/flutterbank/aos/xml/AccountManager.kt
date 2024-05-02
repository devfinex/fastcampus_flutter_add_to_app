package kr.flutterbank.aos.xml

import androidx.lifecycle.MutableLiveData

object AccountManager {
  val accounts = MutableLiveData<List<Account>>(arrayListOf(
    Account("10011"),
    Account("20012")
  ))

  fun checkAccountNoValid(accountNo: String): Boolean {
    val accts = accounts.value.orEmpty()
    return accountNo.isNotBlank() && !accts.map { it.no }.contains(accountNo)
  }

  fun makeAccount(accountNo: String): Boolean {
    val accts = accounts.value.orEmpty().toMutableList()
    accts.add(Account(accountNo))
    accounts.postValue(accts)
    return true
  }
}