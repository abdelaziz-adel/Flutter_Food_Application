import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/main_model.dart';
import '../theme/theme.dart';
import '../util/sections.dart';
import '../windows/all_window.dart';

class foucs_page extends StatefulWidget {
  final String name;
  final int i;
  const foucs_page({
    super.key,
    required this.name,
    required this.i,
  });

  @override
  State<foucs_page> createState() => _foucs_pageState();
}

class _foucs_pageState extends State<foucs_page> {
  bool checker = true;
  int added = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset <
          _scrollController.position.minScrollExtent) {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<food>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 1.99,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width / 1.99,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        widget.name == "Burger"
                            ? value.Burger[widget.i][3]
                            : widget.name == "Pizza"
                                ? value.Pizza[widget.i][3]
                                : widget.name == "Salad"
                                    ? value.Salad[widget.i][3]
                                    : '',
                        width: MediaQuery.of(context).size.width / 1.25,
                        height: MediaQuery.of(context).size.width / 1.25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 0.75,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            iconSize: 17,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                        IconButton(
                          iconSize: 19,
                          onPressed: () {},
                          icon: Icon(Icons.more_vert_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name == "Burger"
                              ? value.Burger[widget.i][0]
                              : widget.name == "Pizza"
                                  ? value.Pizza[widget.i][0]
                                  : widget.name == "Salad"
                                      ? value.Salad[widget.i][0]
                                      : '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          widget.name == "Burger"
                              ? value.Burger[widget.i][2].toString() + " L.E"
                              : widget.name == "Pizza"
                                  ? value.Pizza[widget.i][2].toString() + " L.E"
                                  : widget.name == "Salad"
                                      ? value.Salad[widget.i][2].toString() +
                                          " L.E"
                                      : '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.name == "Burger"
                          ? value.Burger[widget.i][1]
                          : widget.name == "Pizza"
                              ? value.Pizza[widget.i][1]
                              : widget.name == "Salad"
                                  ? value.Salad[widget.i][1]
                                  : '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!checker) {
                        setState(() {
                          checker = true;
                        });
                      }
                    },
                    child: sections(text: "Details", check: checker),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (checker) {
                        setState(() {
                          checker = false;
                        });
                      }
                    },
                    child: sections(text: "Reviews", check: !checker),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (checker)
                Padding(
                  padding: EdgeInsets.only(left: 18, right: 25),
                  child: Text(
                    "The restaurant's signature dish, the truffle risotto, is a creamy blend of arborio rice, rich truffle essence, and savory mushrooms. Each bite offers a luxurious, earthy flavor, topped with fresh herbs and Parmesan.",
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(0.7)),
                  ),
                ),
              if (!checker)
                for (int j = 0; j < 2; j++)
                  Consumer<themes>(
                    builder: (context, value, child) => Padding(
                      padding: EdgeInsets.only(left: 18, right: 30),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "lib/!photos/z.png",
                                        width: 40,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            j == 0 ? "Abdelaziz Adel" : "Abdo",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(j == 0 ? "5.0 " : "4.0 "),
                                              for (int i = 0; i < 5; i++)
                                                Icon(
                                                  i == 4 && j == 1
                                                      ? Icons.star_border
                                                      : Icons.star,
                                                  size: 16,
                                                  color: value.theme_data ==
                                                          darkMode
                                                      ? Colors.yellow[700]
                                                      : Colors.orange[700],
                                                )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    j == 0
                                        ? "Rich and creamy truffle risotto with earthy mushrooms and Parmesan; an indulgent, flavorful dish that’s absolutely divine."
                                        : "Deliciously crispy fried chicken with a juicy interior and perfectly seasoned coating; a must-try for comfort food lovers.",
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
              Padding(
                padding:
                    EdgeInsets.only(top: 25, bottom: 25, left: 18, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (added > 0) added--;
                              });
                            },
                            icon: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(500),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.surface,
                                ))),
                        Container(
                            width: 20,
                            child: Center(
                                child: Text(
                              added.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ))),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                added++;
                              });
                            },
                            icon: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(500),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.surface,
                                ))),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (widget.name == "Burger") {
                            value.Burger[widget.i][4] += added;
                          } else if (widget.name == "Pizza") {
                            value.Pizza[widget.i][4] += added;
                          } else if (widget.name == "Salad") {
                            value.Salad[widget.i][4] += added;
                          }
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w500),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 18.0)),
                        textStyle: WidgetStateProperty.all(TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
