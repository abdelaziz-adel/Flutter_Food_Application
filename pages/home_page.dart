import 'package:flutter/material.dart';
import 'package:food_app/theme/theme.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';
import '../util/sections.dart';
import '../windows/all_window.dart';
import '../windows/dynamic_window.dart';
import 'package:switcher_button/switcher_button.dart';

int selected_menu = 0;

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> windows = [
      all_window(),
      dynamic_cards(name: "Pizza"),
      dynamic_cards(name: "Burger"),
      dynamic_cards(name: "Salad"),
    ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    height: 1,
                  ),
                ),
                Row(
                  children: [
                    Column(
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
                              TextSpan(text: "Your Favorite "),
                              TextSpan(
                                text: "Food",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Consumer<themes>(
                      builder: (context, value2, child) => SwitcherButton(
                        value: value2.theme_data == darkMode ? true : false,
                        onChange: (value) {
                          value2.toggle();
                        },
                        offColor: Theme.of(context).colorScheme.primary,
                        onColor: value2.theme_data == lightMode
                            ? Color.fromARGB(255, 255, 255, 255)
                            : Color.fromARGB(255, 40, 40, 40),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          cursorColor: Theme.of(context).colorScheme.primary,
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.44),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(0.44),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.tune_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Consumer<sections_model>(
            builder: (context, value, child) => Expanded(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          GestureDetector(
                            onTap: () {
                              value.check(i);
                              selected_menu = i;
                            },
                            child: sections(
                              text: value.data[i][0],
                              check: value.data[i][1],
                            ),
                          ),
                        SizedBox(width: 18),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          windows[selected_menu],
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
