import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';
import '../pages/foucs_page.dart';

class liked_cards extends StatelessWidget {
  liked_cards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<food>(
      builder: (context, value, child) {
        int length = (value.liked.length / 2).ceil();
        return value.liked.length != 0
            ? Column(
                children: [
                  for (int i = 0; i < length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int j = 0; j < 2; j++)
                          if (value.liked.length % 2 == 0)
                            cards3(
                              i: (i * 2) + j,
                            ),
                        for (int j = 0; j < 2; j++)
                          if (value.liked.length % 2 != 0 && i != length - 1)
                            cards3(
                              i: (i * 2) + j,
                            ),
                        if (value.liked.length % 2 != 0 && i == length - 1)
                          cards3(
                            i: i * 2,
                          ),
                        if (value.liked.length % 2 != 0 && i == length - 1)
                          Container(
                            width: 175,
                            height: 285,
                          )
                      ],
                    ),
                ],
              )
            : Center(
                child: Text(
                "No liked items",
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .tertiary
                        .withOpacity(0.4)),
              ));
      },
    );
  }
}

class cards3 extends StatelessWidget {
  int i;
  cards3({
    super.key,
    required this.i,
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
                            value.heart_check(
                                value.liked[i][1], value.liked[i][7]);
                          },
                          icon: Image.asset(
                            value.liked[i][6],
                            width: 25,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 25),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                int y = value.full_list.indexOf(value.liked[i]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => foucs_page(
                                          name: value.liked[i][1],
                                          i: value.full_list[y][7])),
                                );
                              },
                              child: Image.asset(
                                value.liked[i][3],
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
                                  int y =
                                      value.full_list.indexOf(value.liked[i]);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => foucs_page(
                                            name: value.liked[i][1],
                                            i: value.full_list[y][7])),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      value.liked[i][0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      value.liked[i][1],
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
                                    value.liked[i][2].toString() + " L.E",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        int y = value.full_list
                                            .indexOf(value.liked[i]);
                                        if (value.liked[i][1] == "Burger") {
                                          value.Burger[value.full_list[y][7]]
                                              [4]++;
                                          value.update_list();
                                        } else if (value.liked[i][1] ==
                                            "Pizza") {
                                          value.Pizza[value.full_list[y][7]]
                                              [4]++;
                                          value.update_list();
                                        } else if (value.liked[i][1] ==
                                            "Salad") {
                                          value.Salad[value.full_list[y][7]]
                                              [4]++;
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
