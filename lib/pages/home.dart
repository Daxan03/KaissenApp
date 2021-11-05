import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "pagina de Home. Tips como en instagram",
        textScaleFactor: 2.0,
      ),

      /*Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.white,
            margin: EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 400,
              height: 200,
              child: Icon(
                Icons.home,
                size: 100,
                color: Colors.black,
              ),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),*/
    );
  }
}
