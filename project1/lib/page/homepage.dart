import 'package:flutter/material.dart';
import 'package:flutter_application_2_coinapi/page/homebody.dart';
import 'package:flutter_application_2_coinapi/page/buypage.dart';
import 'package:flutter_application_2_coinapi/page/favoritecoinpage.dart';
import 'package:flutter_application_2_coinapi/page/settingpage.dart';
import 'package:flutter_application_2_coinapi/page/walletpage.dart';
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);
  @override
  State<Home_Page> createState() => _Home_PageState();
}
class _Home_PageState extends State<Home_Page> {


  int _selectedIndex = 0;
  static const List<Widget>_changeScreen = [
    MainBodyStl(),
    BuyCoinStl(),
    FavoriteCoinStl(),
    WalletPageStl(),
    SettingPageStl()
  ];

  void _onItemTapped(int index) {
    setState(() {
      // print(index);
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    print("เรียกใช้ build");
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: 
      PreferredSize(
        preferredSize: Size.fromHeight(devicewidth*0.1),
        child: AppBar(
          title: Text("Coin", style: TextStyle(fontSize: devicewidth*0.06),),
        ),
      ),
      // body: MainBodyStl(),
      body: _changeScreen[_selectedIndex],



      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.indigo,
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Buy/Sell',
      backgroundColor: Colors.indigo,
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Japan Price',
      backgroundColor: Colors.indigo,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet),
        label: 'Balance',
        backgroundColor: Colors.indigo,
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
      backgroundColor: Colors.indigo,
      ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      ),
      );
  }
}
