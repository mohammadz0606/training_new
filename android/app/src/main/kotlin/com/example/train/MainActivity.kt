package com.example.train

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Build.VERSION
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class MainActivity : FlutterActivity(),PaymentResultListener {
    private val CHANNEL = "samples.flutter.dev/battery"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // This method is invoked on the main thread.
            call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int = if (VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }

    private fun payment() {
        var request = OpenPaymentRequest()
        request.paymentType = PaymentType.SALES.name // for pre-auth pass
        PaymentType.PREAUTH.name
        request.add("AuthenticationToken", "MmQ2OTQyMTQyNjUyZmIzYTY4ZGZhOThh")
        request.add("TransactionID", "1692281225720")
        request.add("MerchantID", "Merchant")
        request.add("ClientIPaddress", "3.7.21.24")
        request.add("Amount", "200")
        request.add("Currency", "682")
        request.add("PaymentDescription", "Sample Payment")
        request.add("AgreementID", "17b61316feafe09feb")
        request.add("AgreementType", "Recurring")
        request.add("Language", "en")
        request.add("ThreeDSEnable", true)
        request.add("TokenizeCard", true)
        request.add("CardScanningEnable", false)
        request.add("SaveCard", true)
        request.add("PaymentMethod", arrayListOf<String>(PaymentMethod.Cards.name))
        request.add("CardType", arrayListOf<String>(CardType.VISA.name,
                CardType.MASTERCARD.name, CardType.AMEX.name, CardType.DINERS.name, CardType.U
                NION.name, CardType.JCB.name, CardType.DISCOVER.name, CardType.MADA.name))
        //optional param
        request.addOptional("ItemID", "Item1")
        request.addOptional("Quantity", "1")
        request.addOptional("Version", "1.0")
        request.addOptional("FrameworkInfo", "Android 7.0")
        request.add("Tokens", "token1,token2,token3")
        var checkout = Checkout(this, this)
        checkout.open(request)
    }

}



