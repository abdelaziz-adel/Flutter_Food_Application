import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';
import '../pages/foucs_page.dart';

class all_window extends StatelessWidget {
  const all_window({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int j = 0; j < 2; j++)
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      j == 0
                          ? "Popular Food"
                          : j == 1
                              ? "Nearest"
                              : "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++) cards(i: i, j: j),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}

var temp = food();

class cards extends StatelessWidget {
  final int i;
  final int j;
  final int randomNumber;
  final String name;

  cards({
    super.key,
    required this.i,
    required this.j,
  })  : randomNumber = (i == 0)
            ? Random().nextInt(temp.Burger.length)
            : (i == 1)
                ? Random().nextInt(temp.Pizza.length)
                : (i == 2)
                    ? Random().nextInt(temp.Salad.length)
                    : 0,
        name = (i == 0)
            ? "Burger"
            : (i == 1)
                ? "Pizza"
                : (i == 2)
                    ? "Salad"
                    : "";

  @override
  Widget build(BuildContext context) {
    return Consumer<food>(builder: (context, value, child) {
      return Column(
        children: [
          Row(
            children: [
              SizedBox(width: 15),
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
                              value.heart_check(name, randomNumber);
                            },
                            icon: Image.asset(
                              i == 0
                                  ? value.Burger[randomNumber][6]
                                  : i == 1
                                      ? value.Pizza[randomNumber][6]
                                      : i == 2
                                          ? value.Salad[randomNumber][6]
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => foucs_page(
                                        name: i == 0
                                            ? "Burger"
                                            : i == 1
                                                ? "Pizza"
                                                : i == 2
                                                    ? "Salad"
                                                    : '',
                                        i: randomNumber)),
                              );
                            },
                            child: Center(
                              child: Image.asset(
                                i == 0
                                    ? value.Burger[randomNumber][3]
                                    : i == 1
                                        ? value.Pizza[randomNumber][3]
                                        : i == 2
                                            ? value.Salad[randomNumber][3]
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
                                        builder: (context) => foucs_page(
                                            name: i == 0
                                                ? "Burger"
                                                : i == 1
                                                    ? "Pizza"
                                                    : i == 2
                                                        ? "Salad"
                                                        : '',
                                            i: randomNumber)),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      i == 0
                                          ? value.Burger[randomNumber][0]
                                          : i == 1
                                              ? value.Pizza[randomNumber][0]
                                              : i == 2
                                                  ? value.Salad[randomNumber][0]
                                                  : '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      i == 0
                                          ? value.Burger[randomNumber][1]
                                          : i == 1
                                              ? value.Pizza[randomNumber][1]
                                              : i == 2
                                                  ? value.Salad[randomNumber][1]
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
                                    i == 0
                                        ? value.Burger[randomNumber][2]
                                                .toString() +
                                            " L.E"
                                        : i == 1
                                            ? value.Pizza[randomNumber][2]
                                                    .toString() +
                                                " L.E"
                                            : i == 2
                                                ? value.Salad[randomNumber][2]
                                                        .toString() +
                                                    " L.E"
                                                : '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        if (i == 0) {
                                          value.Burger[randomNumber][4]++;
                                        } else if (i == 1) {
                                          value.Pizza[randomNumber][4]++;
                                        } else if (i == 2) {
                                          value.Salad[randomNumber][4]++;
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
