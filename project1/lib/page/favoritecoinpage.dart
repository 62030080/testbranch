import 'package:flutter/material.dart';
import 'package:flutter_application_2_coinapi/material/pagetextconfig.dart';

class FavoriteCoinStl extends StatelessWidget {
  const FavoriteCoinStl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FavoriteCoinStf();
  }
}

class FavoriteCoinStf extends StatefulWidget {
  const FavoriteCoinStf({Key? key}) : super(key: key);

  @override
  State<FavoriteCoinStf> createState() => _FavoriteCoinStfState();
}

class _FavoriteCoinStfState extends State<FavoriteCoinStf> {
  @override
  Widget build(BuildContext context) {
    return Center(child: TextConfigStl("Favorite Coin", 50));
  }
}

