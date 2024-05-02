package kr.flutterbank.aos.compose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import kr.flutterbank.aos.compose.ui.theme.FlutterBankTheme

data class Account(
  var no: String
)

class MainActivity : ComponentActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContent {
      FlutterBankTheme {
        Surface(color = Color(247, 247, 247, 255)) {
          ContentView()
        }
      }
    }
  }
}

@Composable
fun ContentView() {
  val scrollState = rememberScrollState()
  val context = LocalContext.current
  val accounts = remember {
    AccountManager.accounts
  }

  Column(modifier = Modifier
    .fillMaxSize()
    .padding(vertical = 10.dp, horizontal = 20.dp)
    .verticalScroll(scrollState)
  ) {
    accounts.forEach { account -> AccountView(account) }
    Button(
      shape = RoundedCornerShape(20.dp),
      colors = ButtonDefaults.buttonColors(containerColor = Color.White),
      modifier = Modifier
        .fillMaxWidth()
        .height(50.dp),
      onClick = {
        // TODO: 터치시 계좌개설 화면으로 이동
      }) {
      Text("+", color = Color.Black)
    }
  }
}

@Composable
fun AccountView(account: Account) {
  Row(
    modifier = Modifier
      .fillMaxWidth()
      .height(100.dp)
      .padding(bottom = 10.dp)
      .clip(RoundedCornerShape(20.dp))
      .background(color = Color(88, 103, 130, 255)),
    horizontalArrangement = Arrangement.SpaceBetween,
    verticalAlignment = Alignment.CenterVertically,
  ) {
    AccountTextView(Modifier.padding(start = 20.dp), "계좌번호")
    AccountTextView(Modifier.padding(end = 20.dp), account.no)
  }
}

@Composable
fun AccountTextView(modifier: Modifier, text: String) {
  Text(modifier = modifier, text = text, color = Color.White)
}
