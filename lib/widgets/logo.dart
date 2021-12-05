import 'package:flutter/material.dart';


class LogoHeader extends StatelessWidget 
{

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: MediaQuery.of(context).size.width * 0.38,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(blurRadius: 15, color: Colors.black26)
          ]
        ),
        child: Center(
          child: Image.asset('assets/images/KaisenAppLogo.png')
        ),
      ),
    );
  }
}