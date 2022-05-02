import 'package:flutter/material.dart';
import 'package:flutter_application_2_coinapi/material/pagetextconfig.dart';

class WalletPageStl extends StatelessWidget {
  const WalletPageStl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalletPageStf();
  }
}

class WalletPageStf extends StatefulWidget {
  const WalletPageStf({Key? key}) : super(key: key);

  @override
  State<WalletPageStf> createState() => _WalletPageStfState();
}

class _WalletPageStfState extends State<WalletPageStf> {
  @override
  Widget build(BuildContext context) {
    return Center(child: TextConfigStl("User Balance", 50));
  }
}
