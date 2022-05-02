import 'package:flutter/material.dart';

class Custom_Dialog_Box extends StatefulWidget {
  final String title, name, price, image, desc;

  const Custom_Dialog_Box(
      {Key? key,
      required this.title,
      required this.name,
      required this.price,
      required this.image,
      required this.desc})
      : super(key: key);

  @override
  State<Custom_Dialog_Box> createState() => _Custom_Dialog_BoxState();
}

class _Custom_Dialog_BoxState extends State<Custom_Dialog_Box> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 30.0,
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          margin: EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                widget.price,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Container(
                child: Image(image: AssetImage(widget.image)),
              ),
              SizedBox(
                child: Text(
                  widget.desc,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              // Text(
              //   widget.desc,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 18.0,
              //   ),
              // ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(
                    "BUY",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(
                    "BACK",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
