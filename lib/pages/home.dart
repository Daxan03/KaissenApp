import 'package:flutter/material.dart';


class PageHome extends StatefulWidget {
  @override
  _PageHome createState() => _PageHome();
}

class _PageHome extends State<PageHome>
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
                  'Esguince',
                  'Ver mas',
                  'assets/images/esguince.jpg',
                  RouteWhereYouGo(),
                  'Lumbalgia',
                  'Ver mas',
                  'assets/images/lumbal.jpg',
                  RouteWhereYouGo2()),
              groupOfCards(
                  'Parálisis facial',
                  'Ver mas',
                  'assets/images/paralisis.jpg',
                  RouteWhereYouGo3(),
                  'Prótesis',
                  'Ver mas',
                  'assets/images/prote.jpg',
                  RouteWhereYouGo4()),
              groupOfCards(
                  'Fracturas',
                  'Ver mas',
                  'assets/images/fract.jpg',
                  RouteWhereYouGo(),
                  'Dolor cervical',
                  'Ver mas',
                  'assets/images/dol_cer.jpg',
                  RouteWhereYouGo()),
              groupOfCards(
                  'Lesion deportiva',
                  'Ver mas',
                  'assets/images/lesion.jpg',
                  RouteWhereYouGo(),
                  'Tendinitis',
                  'Ver mas',
                  'assets/images/tendi.jpg',
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
              'Servicios y tratamientos',
              textScaleFactor: 3.4,
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
  late Widget page;
  late Widget route;

  MyFadeRoute({page, route})
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
      //  brightness: Brightness.light,
        backgroundColor: Colors.blueAccent,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('Esguince',
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
    /*  body: Text('''Durante el examen físico, el médico revisará la inflamación y los puntos de sensibilidad en la extremidad afectada. La ubicación y la intensidad del dolor pueden ayudar a determinar la extensión y la naturaleza del daño.

Las radiografías pueden ayudar a descartar una fractura u otra lesión ósea como la fuente del problema. Las imágenes por resonancia magnética (IRM) también se pueden usar para ayudar a diagnosticar la extensión de la lesión.
        ''',
        textAlign: TextAlign.start,
        textScaleFactor: 1.8,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
        ),*/
        body: ListView(
       padding: EdgeInsets.all(10),
       children: <Widget>[
       _cardTipo1(),
       Divider(),
       Image(
        image: AssetImage('assets/images/esguince.jpg'),
        width: 100,
      fit: BoxFit.contain,
       ),
       ],
      ),
    );
  }
  }


  Widget _cardTipo1(){
    return Card(
     elevation: 10.0,
     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(20.0),
     ),
     child:
Text('''Durante el examen físico, el médico revisará la inflamación y los puntos de sensibilidad en la extremidad afectada. La ubicación y la intensidad del dolor pueden ayudar a determinar la extensión y la naturaleza del daño.

Las radiografías pueden ayudar a descartar una fractura u otra lesión ósea como la fuente del problema. Las imágenes por resonancia magnética (IRM) también se pueden usar para ayudar a diagnosticar la extensión de la lesión.
        ''',
        textAlign: TextAlign.start,
        textScaleFactor: 1.8,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
        ),
         );
  }

  class RouteWhereYouGo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  brightness: Brightness.light,
        backgroundColor: Colors.blueAccent,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('Lumbalgia',
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
        body: ListView(
       padding: EdgeInsets.all(10),
       children: <Widget>[
       _cardTipo2(),
       Divider(),
       Image(
        image: AssetImage('assets/images/lumbal.jpg'),
        width: 100,
      fit: BoxFit.contain,
       ),
       ],
      ),
    );
  }
  }


  Widget _cardTipo2(){
    return Card(
     elevation: 10.0,
     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(20.0),
     ),
     child:
Text('''Realizar un masaje suave y relajante permite que la sensación de presión y dolor disminuya. 

Ultrasonidos: Es una terapia que utiliza la vibración del sonido para provocar un efecto antiinflamatorio en la zona afectada, generando un tipo de masaje vibratorio. 
''',
        textAlign: TextAlign.start,
        textScaleFactor: 1.8,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
        ),
         );
  }


    class RouteWhereYouGo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  brightness: Brightness.light,
        backgroundColor: Colors.blueAccent,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('Parálisis facial',
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
        body: ListView(
       padding: EdgeInsets.all(10),
       children: <Widget>[
       _cardTipo3(),
       Divider(),
       Image(
        image: AssetImage('assets/images/paralisis.jpg'),
        width: 100,
      fit: BoxFit.contain,
       ),
       ],
      ),
    );
  }
  }


  Widget _cardTipo3(){
    return Card(
     elevation: 10.0,
     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(20.0),
     ),
     child:
Text('''La parálisis facial mejora completamente sin tratamiento en la mayoría de los pacientes, pero no en todos. 

Las fisioterapias como el ejercicio, la biorretroalimentación, el tratamiento con láser, la electroterapia, los masajes y la termoterapia se utilizan para acelerar la recuperación, mejorar la función facial y minimizar las secuelas.
''',
        textAlign: TextAlign.start,
        textScaleFactor: 1.8,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
        ),
         );
  }


    class RouteWhereYouGo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  brightness: Brightness.light,
        backgroundColor: Colors.blueAccent,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('Prótesis',
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
        body: ListView(
       padding: EdgeInsets.all(10),
       children: <Widget>[
       _cardTipo4(),
       Divider(),
       Image(
        image: AssetImage('assets/images/prote.jpg'),
        width: 100,
      fit: BoxFit.contain,
       ),
       ],
      ),
    );
  }
  }


  Widget _cardTipo4(){
    return Card(
     elevation: 10.0,
     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(20.0),
     ),
     child:
Text('''Los objetivos que persigue el fisioterapeuta en este tipo de cirugía son los siguientes: 

Disminuir y eliminar la inflamación de la rodilla, y con ello el dolor que presenta el paciente debido a esa hinchazón. 

Tratamiento de la cicatriz para evitar posibles adherencias.
''',
        textAlign: TextAlign.start,
        textScaleFactor: 1.8,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
        ),
         );
  }