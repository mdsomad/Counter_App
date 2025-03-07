import 'package:flutter/material.dart';

class DescriptionTextShowWidget extends StatefulWidget {
  final String text;

  DescriptionTextShowWidget({required this.text});

  @override
  _DescriptionTextShowWidgetState createState() =>
      new _DescriptionTextShowWidgetState();
}

class _DescriptionTextShowWidgetState extends State<DescriptionTextShowWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 140) {
      firstHalf = widget.text.substring(0, 140).trim();
      secondHalf = widget.text.substring(140, widget.text.length);
    } else {
      firstHalf = widget.text.trim();
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new SelectableText(
              firstHalf,
              // minLines: 2,
              // maxLines: 2,
              // maxLines:3,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )
          : new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new SelectableText(
                  // minLines: 2,
                  // maxLines: 2,
                  // maxLines:3,
                  textAlign: TextAlign.left,
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? "show more" : "show less",
                        style: new TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
