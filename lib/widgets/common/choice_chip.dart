import 'package:flutter/material.dart';

class ChoiceChip2 extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isflightSelected;

  const ChoiceChip2(this.icon, this.text, this.isflightSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: widget.isflightSelected
          ? BoxDecoration(
              color: Colors.blue,//Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : BoxDecoration(
              color: Colors.lightBlue,//Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }
}