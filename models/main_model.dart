import 'package:flutter/material.dart';
import '../theme/theme.dart';

class bottom_nav extends ChangeNotifier {
  List icons = [
    ["hut", "lib/!icons/hut2.png", true],
    ["heart", "lib/!icons/heart.png", false],
    ["shopping-cart", "lib/!icons/shopping-cart.png", false],
    ["user", "lib/!icons/user.png", false],
  ];
  check(int ii) {
    for (int i = 0; i < icons.length; i++) {
      if (i == ii) {
        icons[i][2] = true;
      } else {
        icons[i][2] = false;
      }
    }
    for (var item in icons) {
      if (item[2]) {
        item[1] = "lib/!icons/${item[0] + "2"}.png";
      } else {
        item[1] = "lib/!icons/${item[0]}.png";
      }
    }
    notifyListeners();
  }
}

class sections_model extends ChangeNotifier {
  List data = [
    ["All", true],
    ["Pizza", false],
    ["Burger", false],
    ["Salad", false],
  ];

  check(int ii) {
    for (int i = 0; i < data.length; i++) {
      if (i == ii) {
        data[i][1] = true;
      } else {
        data[i][1] = false;
      }
    }
    notifyListeners();
  }
}

class food extends ChangeNotifier {
  List Burger = [
    [
      "Cheese Burger",
      "Burger",
      125,
      "lib/!photos/burger2.png",
      0,
      false,
      "",
      0
    ],
    [
      "Double Cheese Burger",
      "Burger",
      200,
      "lib/!photos/burger1.png",
      0,
      false,
      "",
      1
    ],
    ["Smoked House", "Burger", 190, "lib/!photos/burger3.png", 0, false, "", 2],
    ["Hambuger", "Burger", 150, "lib/!photos/burger4.png", 0, false, "", 3],
    [
      "Shrimp Burger",
      "Burger",
      250,
      "lib/!photos/burger5.png",
      0,
      false,
      "",
      4
    ],
    [
      "Mushroom Ranch",
      "Burger",
      225,
      "lib/!photos/burger6.png",
      0,
      false,
      "",
      5
    ],
  ];

  List Pizza = [
    [
      "Margherita Pizza",
      "Pizza",
      200,
      "lib/!photos/pizza1.png",
      0,
      false,
      "",
      0
    ],
    [
      "Pepperoni Pizza",
      "Pizza",
      280,
      "lib/!photos/pizza2.png",
      0,
      false,
      "",
      1
    ],
    ["Vegan Pizza", "Pizza", 225, "lib/!photos/pizza3.png", 0, false, "", 2],
    [
      "Meat Lover's Pizza",
      "Pizza",
      320,
      "lib/!photos/pizza4.png",
      0,
      false,
      "",
      3
    ],
    ["Pesto Pizza", "Pizza", 275, "lib/!photos/pizza5.png", 0, false, "", 4],
    ["Hawaiian Pizza", "Pizza", 300, "lib/!photos/pizza6.png", 0, false, "", 5],
  ];

  List Salad = [
    [
      "Cadini's Caesar",
      "Salad",
      115,
      "lib/!photos/salad3.png",
      0,
      false,
      "",
      0
    ],
    ["Chinatown", "Salad", 100, "lib/!photos/salad1.png", 0, false, "", 1],
    ["The Hipster", "Salad", 85, "lib/!photos/salad4.png", 0, false, "", 2],
    ["Downtown Cobb", "Salad", 85, "lib/!photos/salad2.png", 0, false, "", 3],
  ];

  List full_list = [];
  update_list() {
    full_list.clear();
    for (var element in Burger) {
      full_list.add(element);
    }
    for (var element in Pizza) {
      full_list.add(element);
    }
    for (var element in Salad) {
      full_list.add(element);
    }
    notifyListeners();
  }

  num full_price() {
    num result = 0;
    for (var element in full_list) {
      result += (element[2] * element[4]);
    }
    return result;
  }

  reset(int i) {
    full_list[i][4] = 0;
    notifyListeners();
  }

  List liked = [];

  food() {
    for (int i = 0; i < Burger.length; i++) {
      if (Burger[i][5]) {
        Burger[i][6] = "lib/!icons/heart2.png";
        liked.add(Burger[i]);
      } else {
        Burger[i][6] = "lib/!icons/heart.png";
      }
    }
    for (int i = 0; i < Pizza.length; i++) {
      if (Pizza[i][5]) {
        Pizza[i][6] = "lib/!icons/heart2.png";
        liked.add(Pizza[i]);
      } else {
        Pizza[i][6] = "lib/!icons/heart.png";
      }
    }
    for (int i = 0; i < Salad.length; i++) {
      if (Salad[i][5]) {
        Salad[i][6] = "lib/!icons/heart2.png";
        liked.add(Salad[i]);
      } else {
        Salad[i][6] = "lib/!icons/heart.png";
      }
    }
    update_list();
    notifyListeners();
  }

  heart_check(String name, int i) {
    if (name == "Burger") {
      Burger[i][5] = !Burger[i][5];
      if (Burger[i][5]) {
        Burger[i][6] = "lib/!icons/heart2.png";
        liked.add(Burger[i]);
      } else {
        Burger[i][6] = "lib/!icons/heart.png";
        liked.remove(Burger[i]);
      }
    } else if (name == "Pizza") {
      Pizza[i][5] = !Pizza[i][5];
      if (Pizza[i][5]) {
        Pizza[i][6] = "lib/!icons/heart2.png";
        liked.add(Pizza[i]);
      } else {
        Pizza[i][6] = "lib/!icons/heart.png";
        liked.remove(Pizza[i]);
      }
    } else if (name == "Salad") {
      Salad[i][5] = !Salad[i][5];
      if (Salad[i][5]) {
        Salad[i][6] = "lib/!icons/heart2.png";
        liked.add(Salad[i]);
      } else {
        Salad[i][6] = "lib/!icons/heart.png";
        liked.remove(Salad[i]);
      }
    }

    notifyListeners();
  }
}

class themes with ChangeNotifier {
  ThemeData theme_data = darkMode;

  toggle() {
    if (theme_data == darkMode) {
      theme_data = lightMode;
    } else {
      theme_data = darkMode;
    }
    notifyListeners();
  }
}
