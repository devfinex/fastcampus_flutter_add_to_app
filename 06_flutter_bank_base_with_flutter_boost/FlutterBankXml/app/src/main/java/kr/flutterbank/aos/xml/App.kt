package kr.flutterbank.aos.xml

import android.app.Application
import com.idlefish.flutterboost.FlutterBoost
import io.flutter.embedding.engine.FlutterEngineGroup

class App: Application() {
  lateinit var engines: FlutterEngineGroup

  override fun onCreate() {
    super.onCreate()
    engines = FlutterEngineGroup(this)

    FlutterBoost.instance().setup(this, BoostDelegate) {
    }
  }
}