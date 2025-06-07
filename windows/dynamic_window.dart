import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';
import '../pages/foucs_page.dart';

class dynamic_cards extends StatelessWidget {
  String name;
  dynamic_cards({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<food>(
      builder: (context, value, child) {
        int length = 0;
        if (name == "Pizza") {
          length = value.Pizza.length;
        } else if (name == "Burger") {
          length = value.Burger.length;
        } else if (name == "Salad") {
          length = value.Salad.length;
        }

        return Column(
          children: [
            for (int i = 0; i < length / 2; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int j = 0; j < 2; j++)
                    cards2(
                      i: (i * 2) + j,
                      name: name,
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}

class cards2 extends StatelessWidget {
  int i;
  String name;
  cards2({
    super.key,
    required this.i,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<food>(builder: (context, value, child) {
      return Column(
        children: [
          Row(
            children: [
              Container(
                width: 175,
                height: 285,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              value.heart_check(name, i);
                            },
                            icon: Image.asset(
                              name == "Burger"
                                  ? value.Burger[i][6]
                                  : name == "Pizza"
                                      ? value.Pizza[i][6]
                                      : name == "Salad"
                                          ? value.Salad[i][6]
                                          : '',
                              width: 25,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 25),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          foucs_page(name: name, i: i)),
                                );
                              },
                              child: Image.asset(
                                name == "Burger"
                                    ? value.Burger[i][3]
                                    : name == "Pizza"
                                        ? value.Pizza[i][3]
                                        : name == "Salad"
                                            ? value.Salad[i][3]
                                            : '',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            foucs_page(name: name, i: i)),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name == "Burger"
                                          ? value.Burger[i][0]
                                          : name == "Pizza"
                                              ? value.Pizza[i][0]
                                              : name == "Salad"
                                                  ? value.Salad[i][0]
                                                  : '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      name == "Burger"
                                          ? value.Burger[i][1]
                                          : name == "Pizza"
                                              ? value.Pizza[i][1]
                                              : name == "Salad"
                                                  ? value.Salad[i][1]
                                                  : '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary
                                              .withOpacity(0.6)),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    name == "Burger"
                                        ? value.Burger[i][2].toString() + " L.E"
                                        : name == "Pizza"
                                            ? value.Pizza[i][2].toString() +
                                                " L.E"
                                            : name == "Salad"
                                                ? value.Salad[i][2].toString() +
                                                    " L.E"
                                                : '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        if (name == "Burger") {
                                          value.Burger[i][4]++;
                                          value.update_list();
                                        } else if (name == "Pizza") {
                                          value.Pizza[i][4]++;
                                          value.update_list();
                                        } else if (name == "Salad") {
                                          value.Salad[i][4]++;
                                          value.update_list();
                                        }
                                      },
                                      icon: Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ))),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      );
    });
  }
}
