import 'package:flutter/material.dart';

class PageCitas extends StatelessWidget {
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
              height: 200,
              child: Text(
                "Realmente es un cambio en la pagina de citas?",
              ),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
