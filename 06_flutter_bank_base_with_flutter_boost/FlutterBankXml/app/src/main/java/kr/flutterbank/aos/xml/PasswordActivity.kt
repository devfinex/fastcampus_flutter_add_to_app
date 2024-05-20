package kr.flutterbank.aos.xml

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import com.idlefish.flutterboost.FlutterBoost

class PasswordActivity : AppCompatActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_password)

    val closeButton = findViewById<Button>(R.id.close_button)
    closeButton.setOnClickListener {
      finish()
      FlutterBoost.instance().sendEventToFlutter("info", mapOf("password" to "1234"))
    }
  }
}