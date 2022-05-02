import 'package:flutter/material.dart';
import 'package:flutter_application_2_coinapi/material/pagetextconfig.dart';

class SettingPageStl extends StatelessWidget {
  const SettingPageStl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingPageStf();
  }
}

class SettingPageStf extends StatefulWidget {
  const SettingPageStf({Key? key}) : super(key: key);

  @override
  State<SettingPageStf> createState() => _SettingPageStfState();
}

class _SettingPageStfState extends State<SettingPageStf> {
  @override
  Widget build(BuildContext context) {
    return Center(child: TextConfigStl("Setting", 50));
  }
}
