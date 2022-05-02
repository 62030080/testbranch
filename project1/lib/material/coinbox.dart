import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'checkimg.dart';

class CoinBox extends StatelessWidget {
  String symbol_cb;
  String cname; //ชื่อเหรียญ
  double cprice; //ราคาเหรียญ
  String cimage; //รูปเหรียญ
  Color color; //สีกล่อง
  double size; //ขนาดกล่อง
  CoinBox(this.symbol_cb ,this.cname, this.cprice, this.cimage, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    double devicewidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: size,
      child: Row(
        children: [
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cname,
                style: TextStyle(
                    fontSize: devicewidth*0.1,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${NumberFormat("#,###.#####").format(cprice)} USD',
                style: TextStyle(
                    fontSize: devicewidth*0.05,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ),

          SizedBox(
              width: devicewidth*0.3,
              height: devicewidth*0.3,
              child: CheckImg(
                aimg: cimage,
                symcheck: symbol_cb,
              ))
              // Image(
              //   image: NetworkImage(cimage),width: 100,height: 50,)
          ],
      ),
    );
  }
}
