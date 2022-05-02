import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2_coinapi/material/coingraph.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../material/checkimg.dart';

class CoinDataPageStf extends StatefulWidget {
  final double  price_c , marketCap_c, volume_c;
  final String currency_c;
  final String?
  color_c,
      index_c, icon_c, symbol_c, name_c, rank_c;
  const CoinDataPageStf({Key? key,
    required this.currency_c,
    required this.icon_c,
    required this.symbol_c,
    required this.name_c,
    required this.price_c,
    required this.marketCap_c,
    required this.volume_c,
    required this.rank_c,
    required this.index_c,
    required this.color_c,

  }) : super(key: key);
  @override
  State<CoinDataPageStf> createState() => _CoinDataPageStfState();
}

class _CoinDataPageStfState extends State<CoinDataPageStf> {
  @override
  Widget build(BuildContext context) {
    // print(widget.color_c);
    // print(widget.color_c??'#000000');
    String color_cc = widget.color_c??'';
    String text_color = '#000000';
    double devicewidth = MediaQuery.of(context).size.width;
    if(widget.color_c == 'null'){
      color_cc = '#949494';
      text_color = '#ffffff';
    }
    if (widget.color_c == '#000000' || widget.color_c == '#3C3C3D' || widget.color_c == '#f7931A'){
      text_color = '#ffffff';
    }
    return Scaffold(
      backgroundColor: HexColor(color_cc),
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(devicewidth*0.1),
        child: AppBar(
          iconTheme: IconThemeData(
            size: devicewidth*0.06,
            color: HexColor(text_color)
          ),
          backgroundColor: HexColor(color_cc),
          title: Text('CoinDataPage',style: TextStyle(fontSize: devicewidth*0.06,color: HexColor(text_color)),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text(
              widget.symbol_c??'', style: TextStyle(
                fontSize: devicewidth * 0.2,fontWeight: FontWeight.bold,color: HexColor(text_color)))),
            Container(
              height: devicewidth /2,
              width: devicewidth *1,
              child: CheckImg(aimg: widget.icon_c??'',
                        symcheck: widget.symbol_c??''
              ),
            ),
            SizedBox(height: devicewidth * 0.05,),
            Container(
                width: devicewidth *1,
                height: devicewidth /2,
                child: CoinGraph(index: widget.index_c??'',color: widget.color_c??'')
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Volume = " +
                    '${NumberFormat("#,###.####").format(widget.volume_c)}' + " " + "หน่วย", style: TextStyle(
                    fontSize: devicewidth * 0.06,fontWeight: FontWeight.bold,color: HexColor(text_color))),
                Text("Price = " +
                  '${NumberFormat("#,###.######").format(widget.price_c??'0')}' + " " + widget.currency_c, style: TextStyle(
                    fontSize: devicewidth * 0.06,fontWeight: FontWeight.bold,color: HexColor(text_color))),
                Text("MarketCap = " +
                    '${NumberFormat("#,###.####").format(widget.marketCap_c??'0')}' + " " + widget.currency_c, style: TextStyle(
                    fontSize: devicewidth * 0.06,fontWeight: FontWeight.bold,color: HexColor(text_color))),
                Text("Rank = ${widget.rank_c??''}", style: TextStyle(
                    fontSize: devicewidth * 0.06,fontWeight: FontWeight.bold,color: HexColor(text_color))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// [Text(widget.symbol_c,style: TextStyle(color: Colors.red, fontSize: 85),),
// Text(widget.name_c,style: TextStyle(color: Colors.blue, fontSize: 85),),
// Text(widget.price_c,style: TextStyle(color: Colors.green, fontSize: 85),),
// Text(widget.marketCap_c,style: TextStyle(color: Colors.orange, fontSize: 85),),
