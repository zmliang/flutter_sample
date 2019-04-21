import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget{
  final VoidCallback _onTap;
  final IconData iconData;

  ControlButton(this.iconData,this._onTap);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(iconData),
        iconSize: 50,
        color: Theme.of(context).buttonColor,
        onPressed: _onTap);
  }
}