import 'package:flutter/material.dart';
import 'package:flutterchatbot/components/my_payment_button.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For base64Encode and jsonEncode

class CartPage extends StatefulWidget {
  final List<String> cart;
  final void Function(String) onRemove;
  final VoidCallback onClear;

  const CartPage({
    Key? key,
    required this.cart,
    required this.onRemove,
    required this.onClear,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful: $response");
    verifySignature(
      signature: response.signature,
      paymentId: response.paymentId,
      orderId: response.orderId,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error: $response");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message ?? 'Payment Failed'),
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet Selected: ${response.walletName}");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.walletName ?? 'External Wallet Selected'),
    ));
  }

  void createOrder() async {
    String username = 'rzp_test_rhCVCAC0wf7m91';
    String password = '5r0i7bO1iVDAc8gtj1JIcQ8Q';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": 41988, // Amount in paise (100 INR)
      "currency": "INR",
      "receipt": "rcptid_11"
    };
    var res = await http.post(
      Uri.https("api.razorpay.com", "v1/orders"),
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
    } else {
      print("Order creation failed: ${res.body}");
    }
  }

  void openGateway(String orderId) {
    var options = {
      'key': 'rzp_test_rhCVCAC0wf7m91',
      'amount': 41981, // 419.81 INR in paise
      'name': 'Superchat Corp',
      'order_id': orderId,
      'description': 'Chatbot Subscription',
      'timeout': 300, // in seconds (5 minutes)
      'prefill': {
        'contact': '9123456789',
        'email': 'ary@example.com',
      }
    };
    _razorpay.open(options);
  }

  void verifySignature({
    String? signature,
    String? paymentId,
    String? orderId,
  }) async {
    Map<String, dynamic> body = {
      'razorpay_signature': signature,
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
    };

    // Verify the signature server-side here
    print("Signature Verification Data: $body");
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              widget.onClear();
              setState(() {}); // Force rebuild after clearing cart
            },
          ),
        ],
      ),
      body: widget.cart.isEmpty
          ? Center(child: Text('No items in the cart'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final product = widget.cart[index];
                      return ListTile(
                        title: Text(product),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            widget.onRemove(product);
                            setState(() {}); // Force rebuild after removing item
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      MyPaymentButton(
                        image: 'assets/images/razorpay.png',
                        onTap: () {
                          createOrder(); // Call Razorpay order creation
                        },
                      ),
                      const SizedBox(height: 8),
                      MyPaymentButton(
                        image: "assets/images/paypal.png",
                        onTap: () {
                          // Handle PayPal payment integration here
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
