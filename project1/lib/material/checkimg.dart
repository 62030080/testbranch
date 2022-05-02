import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CheckImg extends StatelessWidget {
  final String aimg
      ,symcheck
  ;
  const CheckImg({Key? key, required this.aimg
    ,required this.symcheck
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckImgStf(
      checksuccessimg: aimg,
      sym_image: symcheck
    );
  }
}

class CheckImgStf extends StatefulWidget {
  final String checksuccessimg
      ,sym_image
  ;
  const CheckImgStf({Key? key, required this.checksuccessimg
    ,required this.sym_image
  }) : super(key: key);

  @override
  State<CheckImgStf> createState() => _CheckImgStfState();
}

class _CheckImgStfState extends State<CheckImgStf> {
  @override
  Widget build(BuildContext context) {
    String imgurl = widget.checksuccessimg;

    // print("Test");
    // print("${widget.checksuccessimg}");
    // print("imgurl = " + imgurl);

    if(widget.sym_image == 'BNB' || widget.sym_image == 'ADA'){
      imgurl = "https://cdn.pixabay.com/photo/2019/11/25/12/31/french-bulldog-4651905_1280.png";
    }

    RegExp exp = RegExp(r'.svg' , caseSensitive: false);
    // String str = "${imgurl}";

    Iterable<RegExpMatch> matches = exp.allMatches(imgurl);
    // print(widget.index_image);

    if(exp.hasMatch(imgurl)){
      return Container(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child:  SvgPicture.network(imgurl,
            // "${widget.checksuccessimg}",
          ),
        ),
      );
    }else{
      return Container(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Image.network(imgurl
              // "${widget.checksuccessimg}"
          ),
        ),
      );
//asdsadsadsdsadsadsa
    }


  }
}

