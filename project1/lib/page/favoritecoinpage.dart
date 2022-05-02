import 'package:flutter/material.dart';
import 'package:flutter_application_2_coinapi/material/pagetextconfig.dart';
import 'package:http/http.dart' as http;
import '../material/coinDataAPI.dart';
import '../material/coinbox.dart';
import 'coindatapage.dart';

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


  final double JPY = 130.123498;

  late CoinDataApi _dataFromAPI;
  // CoinRank ? _dataFromAPI;
  @override
  void initState() {
    super.initState();
    print('เรียกใช้ initState นะ');
    getCoinRank();
    // setUpTimedFetch();
  }

  // setUpTimedFetch() {
  //   Timer.periodic(Duration(seconds: 5), (timer) {
  //     // Timer.periodic(Duration(milliseconds: 50000), (timer) {
  //     setState(() {
  //       getCoinRank(); // เชื่อม APi
  //     });
  //   });
  // }

  Future <CoinDataApi> getCoinRank() async {
    print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://api.coinranking.com/v2/coins?");
    var response = await http.get(url, headers: <String, String>{
      'x-access-token':
      'coinrankinga098ff1270353e56c70cd5c7ab350b42627418b2ad36929c'
    });
    _dataFromAPI = coinDataApiFromJson(response.body); // Json to Dart
    return _dataFromAPI;
  }
  //
  // final channel = WebSocketChannel.connect(Uri.parse("https://api.coinranking.com/v2/coins?"),);



  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(stream: channel.stream,
    //     builder: (context, snapshot)
    // {
    //   return Text(snapshot.hasData ? '${snapshot.data}' : '');
    // });
    double devicewitdh = MediaQuery.of(context).size.width;
    return FutureBuilder(

      future: getCoinRank(),
      builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          var result = snapshot.data;
          return ListView.builder(
              itemCount: _dataFromAPI.data?.coins!.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)
                                    => CoinDataPageStf(
                                      icon_c: "${result.data.coins[index].iconUrl}",
                                      symbol_c: "${result.data.coins[index].symbol}",
                                      name_c: "${result.data.coins[index].name}",
                                      price_c: double.parse('${result.data.coins[index].price}')*JPY,
                                      marketCap_c: double.parse('${result.data.coins[index].marketCap}')*JPY,
                                      volume_c: double.parse('${result.data.coins[index].hVolume}')*JPY,
                                      rank_c: "${result.data.coins[index].rank}",
                                      index_c: "${index}",
                                      color_c: "${result.data.coins[index].color}",
                                      currency_c: 'JPY',

                                    )
                                ));
                          },
                          child: CoinBox(
                              "${result.data.coins[index].symbol}",
                              "${result.data.coins[index].symbol}",
                              double.parse('${result.data.coins[index].price}')*JPY,
                              "${result.data.coins[index].iconUrl}",
                              Colors.white,
                              devicewitdh*0.3),
                        ),
                      ],
                    )
                );
              }
          );
        }
        return LinearProgressIndicator();
      },);
  }
}

