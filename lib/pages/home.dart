import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              searchBar(),
              SizedBox(height: _w / 20),
              groupOfCards(
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo(),
                  'Ejemplo2',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo()),
              groupOfCards(
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo(),
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo()),
              groupOfCards(
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo(),
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo()),
              groupOfCards(
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo(),
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo()),
              groupOfCards(
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo(),
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo()),
              groupOfCards(
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo(),
                  'Ejemplo',
                  'Ver mas',
                  'assets/images/KaisenAppLogo.png',
                  RouteWhereYouGo()),
            ],
          ),
        ],
      ),
    );
  }


  Widget searchBar() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: _w / 8.5,
            width: _w / 1,
            padding: EdgeInsets.symmetric(horizontal: _w / 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontWeight: FontWeight.w600,
                    fontSize: _w / 22),
                prefixIcon:
                    Icon(Icons.search, color: Colors.black.withOpacity(.6)),
                hintText: 'Buscar',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(height: _w / 14),
          Container(
            width: _w / 1.15,
            child: Text(
              'Example Text',
              textScaleFactor: 1.4,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget groupOfCards(
      String title1,
      String subtitle1,
      String image1,
      Widget route1,
      String title2,
      String subtitle2,
      String image2,
      Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          card(title1, subtitle1, image1, route1),
          card(title2, subtitle2, image2, route2),
        ],
      ),
    );
  }

  Widget card(String title, String subtitle, String image, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          var page2;
          Navigator.of(context).push(MyFadeRoute(route: route, page: page2));
        },
        child: Container(
          width: _w / 2.36,
          height: _w / 1.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: _w / 2.36,
                height: _w / 2.6,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: Image.asset(image),
              ),
              // Image.asset(
              //   image,
              //   fit: BoxFit.cover,
              //   width: _w / 2.36,
              //   height: _w / 2.6),
              Container(
                height: _w / 6,
                width: _w / 2.36,
                padding: EdgeInsets.symmetric(horizontal: _w / 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1.4,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      textScaleFactor: 1,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  MyFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('EXAMPLE  PAGE',
            style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 1)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}


