import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class cart_window extends StatelessWidget {
  int i;
  cart_window({
    super.key,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<food>(
      builder: (context, value, child) {
        bool check = true;
        for (var element in value.full_list) {
          if (element[4] > 0) {
            check = false;
            break;
          }
        }
        if (check) {
          return Center(
              child: Column(
            children: [
              Text(i == 0 ? "Your cart in empty" : '',
                  style: TextStyle(
                      fontSize: i == 0 ? 14 : 0,
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.4))),
              SizedBox(height: i == 0 ? 20 : 0),
            ],
          ));
        } else {
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Slidable(
                    endActionPane:
                        ActionPane(motion: ScrollMotion(), children: [
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Container(
                        //width: MediaQuery.of(context).size.width * 0.2,
                        child: SlidableAction(
                          onPressed: (clicked) {
                            value.reset(i);
                          },
                          icon: Icons.delete,
                          foregroundColor:
                              Theme.of(context).colorScheme.surface,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ]),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: value.full_list[i][4] > 0 ? 90 : 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  value.full_list[i][3],
                                  height: 90,
                                  width: 90,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.full_list[i][0],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        value.full_list[i][1],
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              if (i >= 0 &&
                                                  i < value.Burger.length) {
                                                if (value.Burger[value
                                                        .full_list[i][7]][4] >
                                                    0) {
                                                  value.Burger[value
                                                      .full_list[i][7]][4]--;
                                                  value.update_list();
                                                }
                                              } else if (i >=
                                                      value.Burger.length &&
                                                  i <
                                                      value.Pizza.length +
                                                          value.Burger.length) {
                                                if (value.Pizza[value
                                                        .full_list[i][7]][4] >
                                                    0) {
                                                  value.Pizza[value.full_list[i]
                                                      [7]][4]--;
                                                  value.update_list();
                                                }
                                              } else if (i >=
                                                      value.Pizza.length +
                                                          value.Burger.length &&
                                                  i <
                                                      value.Salad.length +
                                                          value.Pizza.length +
                                                          value.Burger.length) {
                                                if (value.Salad[value
                                                        .full_list[i][7]][4] >
                                                    0) {
                                                  value.Salad[value.full_list[i]
                                                      [7]][4]--;
                                                  value.update_list();
                                                }
                                              }
                                            },
                                            icon: Container(
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          500),
                                                ),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ))),
                                        Container(
                                            width: 20,
                                            child: Center(
                                                child: Text(
                                              value.full_list[i][4].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        IconButton(
                                            onPressed: () {
                                              if (i >= 0 &&
                                                  i < value.Burger.length) {
                                                value.Burger[value.full_list[i]
                                                    [7]][4]++;
                                                value.update_list();
                                              } else if (i >=
                                                      value.Burger.length &&
                                                  i <
                                                      value.Pizza.length +
                                                          value.Burger.length) {
                                                value.Pizza[value.full_list[i]
                                                    [7]][4]++;
                                                value.update_list();
                                              } else if (i >=
                                                      value.Pizza.length +
                                                          value.Burger.length &&
                                                  i <
                                                      value.Salad.length +
                                                          value.Pizza.length +
                                                          value.Burger.length) {
                                                value.Salad[value.full_list[i]
                                                    [7]][4]++;
                                                value.update_list();
                                              }
                                            },
                                            icon: Container(
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          500),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ))),
                                      ],
                                    ),
                                    Text(
                                      (value.full_list[i][2] *
                                                  value.full_list[i][4])
                                              .toString() +
                                          " L.E",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: value.full_list[i][4] > 0 ? 20 : 0),
              ],
            ),
          );
        }
      },
    );
  }
}
