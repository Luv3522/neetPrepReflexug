// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openWebUrlOnExcecption({
  String? msg,
  String? orderId,
  String? amount,
  String? txnToken,
  int? paymentId,
  String? mid,
}) async {
  print(msg);
  if (isWeb) {
    /* TODO: the below is a test url, we either need to change it to a relative path
  on the current url or provide an absolute url*/
    final String encodedAppTitle = Uri.encodeComponent('Reflex - NEET PYQs');
    final String redirectDomain = 'ug.reflexprep.com';
    final url = 'https://www.neetprep.com/payment/js_payment' +
        '?orderId=$orderId&token=$txnToken&amount=$amount' +
        '&paymentId=$paymentId&mid=$mid&title=$encodedAppTitle' +
        '&redirect_domain=$redirectDomain';
    ;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    } else {
      throw 'Could not launch $url';
    }
  } else {
    print("not handled platform scenario");
  }
}

Future<String?> paytmIntegration(String orderId, String amount, String txnToken,
    int paymentId, String mid, String callbackUrl) async {
  try {
    var response = await AllInOneSdk.startTransaction(
        mid, orderId, amount, txnToken, callbackUrl, false, false);
    print("Paytm Response: " + response.toString());
    return response!['STATUS'].toString();
  } on PlatformException catch (e) {
    print("PaytmPlatformExceptionError:" +
        "\n" +
        e.message! +
        " \n  " +
        e.details.toString());
    print(e.toString());
    openWebUrlOnExcecption(
      msg: "platform exception error",
      orderId: orderId,
      amount: amount,
      txnToken: txnToken,
      paymentId: paymentId,
      mid: mid,
    );
    return e.details?['STATUS'].toString();
  } on Exception catch (e) {
    print("PaytmNotPlatformExceptionError:" + "\n" + e.toString());
    print(e.toString());
    openWebUrlOnExcecption(
      msg: "not platform exception error",
      orderId: orderId,
      amount: amount,
      txnToken: txnToken,
      paymentId: paymentId,
      mid: mid,
    );
    return null;
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
    return null;
  }
}
