import 'package:flutter/material.dart';
import 'package:flutterchatbot/components/chatbot_details.dart';
import 'package:flutterchatbot/components/my_tab_bar.dart';
import 'package:flutterchatbot/pages/my_sliver_app_bar.dart';
import '../components/my_drawer.dart';
import '../components/product_tile.dart';

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> cart = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Add product to cart
  void addToCart(String product) {
    setState(() {
      cart.add(product);
    });
  }

  // Remove a single product from cart
  void removeFromCart(String product) {
    setState(() {
      cart.remove(product);
    });
  }

  // Clear the entire cart
  void clearCart() {
    setState(() {
      cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome, ${widget.email}"),
                  ],
                ),
                ChatbotDetails(),
              ],
            ),
            title: MyTabBar(
              tabController: _tabController,
            ),
            cart: cart,
            onRemove: removeFromCart,
            onClear: clearCart,
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            // Products Tab
            ListView(
              children: [
                ProductTile(
                  productName: 'Chatbot 1',
                  productDescription: 'Description of Chatbot Product 1',
                  productPrice: 5,
                  onAddToCart: () => addToCart('Chatbot Product 1'),
                ),
              ],
            ),
            // Purchases Tab
            Text('My Purchases'),
          ],
        ),
      ),
    );
  }
}
