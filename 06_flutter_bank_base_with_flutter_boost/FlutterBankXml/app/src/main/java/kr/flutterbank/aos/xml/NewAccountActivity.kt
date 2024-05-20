package kr.flutterbank.aos.xml

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.idlefish.flutterboost.containers.FlutterBoostActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kr.flutterbank.aos.xml.AccountManager.checkAccountNoValid

class NewAccountActivity : FlutterBoostActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
  }

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flutter_bank")
    channel.setMethodCallHandler { methodCall, result ->
      when (methodCall.method) {
        "pop" -> finish()
        "checkAccount" -> {
          var accountNo = methodCall.arguments
          if (accountNo is String) {
            accountNo = accountNo.trim()
            result.success(checkAccountNoValid(accountNo))
            return@setMethodCallHandler
          }
          result.success(false)
        }
        "makeAccount" -> {
          var accountNo = methodCall.arguments
          if (accountNo is String) {
            accountNo = accountNo.trim()
            if (checkAccountNoValid(accountNo)) {
              result.success(makeAccount(accountNo))
              return@setMethodCallHandler
            }
          } else {
            result.success(false)
          }
        }
      }
    }
  }

  override fun provideFlutterEngine(context: Context): FlutterEngine? {
    val app = context.applicationContext as App
    return app.engines.createAndRunDefaultEngine(context);
  }

  private fun checkAccountNoValid(accountNo: String): Boolean {
    return AccountManager.checkAccountNoValid(accountNo)
  }

  private fun makeAccount(accountNo: String): Boolean {
    return AccountManager.makeAccount(accountNo)
  }
}