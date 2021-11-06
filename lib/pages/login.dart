import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.white,
            margin: EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 400,
              height: 700,
              child: Icon(
                Icons.perm_identity,
                size: 100,
                color: Colors.black,
              ),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
