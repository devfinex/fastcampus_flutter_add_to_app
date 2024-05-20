package kr.flutterbank.aos.xml

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView

class ListViewAdapter(var accounts: List<Account>): BaseAdapter() {
  override fun getCount(): Int = accounts.size

  override fun getItem(position: Int): Account = accounts[position]

  override fun getItemId(position: Int): Long = position.toLong()

  override fun getView(position: Int, view: View?, parent: ViewGroup?): View? {
    var convertView = view
    if (convertView == null) convertView = LayoutInflater.from(parent?.context).inflate(R.layout.item_account, parent, false)

    val account: Account = accounts[position]
    convertView?.findViewById<TextView>(R.id.name_text)?.text = "계좌번호"
    convertView?.findViewById<TextView>(R.id.number_text)?.text = account.no

    return convertView
  }
}