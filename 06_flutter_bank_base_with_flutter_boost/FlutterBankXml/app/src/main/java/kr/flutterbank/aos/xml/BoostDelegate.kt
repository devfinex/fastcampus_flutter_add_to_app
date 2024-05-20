package kr.flutterbank.aos.xml

import android.content.Intent
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.FlutterBoostDelegate
import com.idlefish.flutterboost.FlutterBoostRouteOptions
import com.idlefish.flutterboost.containers.FlutterBoostActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs

object BoostDelegate: FlutterBoostDelegate {
  override fun pushNativeRoute(options: FlutterBoostRouteOptions?) {
    options?.also {
      when (it.pageName()) {
        "password" -> {
          val intent = Intent(FlutterBoost.instance().currentActivity(), PasswordActivity::class.java)
          FlutterBoost.instance().currentActivity().startActivity(intent)
        }
        else -> {
        }
      }
    }
  }

  override fun pushFlutterRoute(options: FlutterBoostRouteOptions?) {
    val intent = FlutterBoostActivity
      .CachedEngineIntentBuilder(NewAccountActivity::class.java)
      .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.opaque)
      .destroyEngineWithActivity(true)
      .url(options?.pageName())
      .urlParams(options?.arguments())
      .build(FlutterBoost.instance().currentActivity())
    FlutterBoost.instance().currentActivity().startActivity(intent)
  }
}