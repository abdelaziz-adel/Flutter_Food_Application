import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';
import '../windows/cart_window.dart';

class cart_page extends StatelessWidget {
  const cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      height: 1.35,
                    ),
                    children: [
                      TextSpan(text: "Your "),
                      TextSpan(
                        text: "Cart",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 2,
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Consumer<food>(
                builder: (context, value, child) => Column(
                  children: [
                    SizedBox(height: 20),
                    for (int i = 0; i < value.full_list.length; i++)
                      cart_window(
                        i: i,
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 5),
                    for (int i = 0; i < 3; i++)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i == 0
                                  ? "Price:"
                                  : i == 1
                                      ? "Taxes:"
                                      : i == 2
                                          ? "Total Price:"
                                          : "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              i == 0
                                  ? value.full_price().ceil().toString() +
                                      " L.E"
                                  : i == 1
                                      ? (value.full_price() * 0.1)
                                              .ceil()
                                              .toString() +
                                          " L.E"
                                      : i == 2
                                          ? (value.full_price() * 1.1)
                                                  .ceil()
                                                  .toString() +
                                              " L.E"
                                          : "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 125),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
