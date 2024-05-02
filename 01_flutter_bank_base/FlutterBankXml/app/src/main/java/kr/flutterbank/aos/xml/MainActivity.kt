package kr.flutterbank.aos.xml

import android.os.Bundle
import android.widget.Button
import android.widget.ListView
import androidx.appcompat.app.AppCompatActivity

data class Account(
  var no: String,
)

class MainActivity : AppCompatActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    val listView = findViewById<ListView>(R.id.list_view)
    val addButton = findViewById<Button>(R.id.add_button)
    val accounts = AccountManager.accounts.value

    val adapter = ListViewAdapter(accounts.orEmpty())
    listView.adapter = adapter
    listView.divider = null
    listView.dividerHeight = 0

    addButton.setOnClickListener {
      // TODO: 계좌개설화면으로 이동
    }

    AccountManager.accounts.observeForever {
      adapter.accounts = it
      adapter.notifyDataSetChanged()
    }
  }
}