import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: pay(),
    );
  }
}

class pay extends StatefulWidget {
  @override
  _payState createState() => _payState();
}

class _payState extends State<pay> {
  TextEditingController _controller=TextEditingController();
  Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay=Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
              ),
              RaisedButton(
                onPressed: ()
                {
                  openCheckout();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  void openCheckout() async {
    var options = {
      'key': 'rzp_test_GhqPm5lhADuAKA',
      'amount': 2000,
      'name': 'Jhanvi Soni.',
      'description': 'Testing',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message
        );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName);
  }
}

