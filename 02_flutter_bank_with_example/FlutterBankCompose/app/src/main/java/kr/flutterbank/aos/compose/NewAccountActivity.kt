package kr.flutterbank.aos.compose

import android.content.Context
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class NewAccountActivity : FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
  }

  override fun provideFlutterEngine(context: Context): FlutterEngine? {
    val app = context.applicationContext as App
    return app.engines.createAndRunDefaultEngine(context);
  }
}