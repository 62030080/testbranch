import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'coinDataAPI.dart';

class CoinGraph extends StatelessWidget {
  final String color, index;
  const CoinGraph ({Key? key, required this.index, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CoinGraphStf(
      index_g: index,
      color_g: color
    );
  }
}

class CoinGraphStf extends StatefulWidget {
  final String index_g, color_g;
  const CoinGraphStf({Key? key, required this.index_g, required this.color_g}) : super(key: key);

  @override
  State<CoinGraphStf> createState() => _CoinGraphStfState();
}

class _CoinGraphStfState extends State<CoinGraphStf> {

  late CoinDataApi _dataFromAPI;
  // CoinRank ? _dataFromAPI;
  @override
  void initState() {
    super.initState();
    print('เรียกใช้ initState');
    getCoinRankForGraph();
  }
  Future <CoinDataApi> getCoinRankForGraph() async {
    print("เรียกใช้ getCoinRankForGraph");
    var url = Uri.parse("https://api.coinranking.com/v2/coins?");
    var response = await http.get(url, headers: <String, String>{
      'x-access-token':
      'coinrankinga098ff1270353e56c70cd5c7ab350b42627418b2ad36929c'
    });
    _dataFromAPI = coinDataApiFromJson(response.body); // Json to Dart
    return _dataFromAPI;
  }

  @override
  Widget build(BuildContext context) {
    String color_gg = widget.color_g;
    print(color_gg);
    if(widget.color_g == 'null'){
      color_gg = '#949494';
    }
    return Scaffold(
      backgroundColor : HexColor(color_gg),
      body:
      FutureBuilder(
        future: getCoinRankForGraph(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return Card(
              margin: const EdgeInsets.all(3),
              elevation: 1,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Initialize the spark charts widget
                  child: SfSparkAreaChart.custom(
                    //Enable the trackball
                    trackball: SparkChartTrackball(
                        activationMode: SparkChartActivationMode.tap),

                    color: HexColor(color_gg),
                    xValueMapper: (int index2) => index2 ,
                    yValueMapper: (int index2) => double.parse( result.data.coins[ int.parse( widget.index_g )].sparkline[index2]) ,
                    dataCount: result.data.coins[int.parse( widget.index_g )].sparkline.length,


                  ),
                ),

              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}