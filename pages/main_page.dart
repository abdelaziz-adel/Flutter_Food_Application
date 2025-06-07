import 'package:flutter/material.dart';
import 'package:food_app/pages/cart_page.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/pages/liked_page.dart';
import 'package:food_app/pages/user_page.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';

class main_page extends StatelessWidget {
  int _selected_page = 0; //0
  List page = [
    home_page(),
    liked_page(),
    cart_page(),
    user_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<bottom_nav>(
        builder: (context, value, child) => Consumer<sections_model>(
            builder: (context, value2, child) => Scaffold(
                  body: Stack(
                    children: [
                      page[_selected_page],
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.all(18),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < value.icons.length; i++)
                                    IconButton(
                                        onPressed: () {
                                          value.check(i);
                                          _selected_page = i;
                                          if (i == 0) {
                                            value2.check(0);
                                            selected_menu = 0;
                                          }
                                        },
                                        icon: Image.asset(
                                          value.icons[i][1],
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          width: 28,
                                        )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
