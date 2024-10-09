// import 'package:flutter/material.dart';
// import 'package:flutterchatbot/pages/cart_page.dart'; // Import the CartPage

// class MySliverAppBar extends StatelessWidget {
//   final Widget child;
//   final Widget title;
//   final List<String> cart;
//   final void Function(String) onRemove;
//   final VoidCallback onClear;

//   const MySliverAppBar({
//     Key? key,
//     required this.child,
//     required this.title,
//     required this.cart,
//     required this.onRemove,
//     required this.onClear,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       pinned: true,
//       floating: true,
//       expandedHeight: 400.0,
//       flexibleSpace: FlexibleSpaceBar(
//         title: title,
//         background: child,
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.shopping_cart),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CartPage(
//                   cart: cart,
//                   onRemove: onRemove,
//                   onClear: onClear,
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutterchatbot/pages/cart_page.dart'; // Import the CartPage

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final List<String> cart;
  final void Function(String) onRemove;
  final VoidCallback onClear;

  const MySliverAppBar({
    Key? key,
    required this.child,
    required this.title,
    required this.cart,
    required this.onRemove,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 400.0,
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: child,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(
                  cart: cart,
                  onRemove: onRemove,
                  onClear: onClear,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
