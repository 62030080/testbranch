import 'package:flutter/material.dart';
import 'package:flutter_application_2_coinapi/material/pagetextconfig.dart';

class BuyCoinStl extends StatelessWidget {
  const BuyCoinStl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuyCoinStf();
  }
}

class BuyCoinStf extends StatefulWidget {
  const BuyCoinStf({Key? key}) : super(key: key);

  @override
  State<BuyCoinStf> createState() => _BuyCoinStfState();
}

class _BuyCoinStfState extends State<BuyCoinStf> {
  @override
  Widget build(BuildContext context) {
    return Center(child: TextConfigStl("Buy Coin", 50));

  }
}

