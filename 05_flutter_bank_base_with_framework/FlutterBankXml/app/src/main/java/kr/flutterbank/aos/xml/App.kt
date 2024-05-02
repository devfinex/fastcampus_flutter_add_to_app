package kr.flutterbank.aos.xml

import android.app.Application
import io.flutter.embedding.engine.FlutterEngineGroup

class App: Application() {
  lateinit var engines: FlutterEngineGroup

  override fun onCreate() {
    super.onCreate()
    engines = FlutterEngineGroup(this)
  }
}