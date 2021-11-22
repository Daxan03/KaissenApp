import 'package:flutter/material.dart';
import 'package:logginprop/widgets/header.dart';
import 'package:logginprop/widgets/logo.dart';
import 'package:logginprop/widgets/TextFieldCustom.dart';



class RegistroPage extends StatelessWidget
{

 @override
 Widget build(BuildContext context)
 {
    return Scaffold(
       body: ListView(
         padding: EdgeInsets.only(top:0),
         physics: BouncingScrollPhysics(),
         children: [

            Stack(
              children: [

                HeaderSignUp(),

                LogoHeader()
              ],
            ),

            //_Titulo(),

            _TextField(),

            _Botton()
         ],
       )
     );
  }
}

class _Botton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(50)
      ),
      child: TextButton(
        child: Text('Iniciar Sesión', style: TextStyle(color: Colors.grey,fontSize: 18)),
        onPressed: (){},
      ),
    );
  }
}

class _TextField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      child: Column(
        children: [

          TextFieldCustom(icono: Icons.person, type: TextInputType.text,texto: 'Nombre completo' ),
          SizedBox(height: 20),
          TextFieldCustom(icono: Icons.mail_outline, type: TextInputType.emailAddress,texto: 'Correo electrónico' ),
          SizedBox(height: 20),
          TextFieldCustom(icono: Icons.phone, type: TextInputType.number,texto: 'Telefono' ),
          SizedBox(height: 20),
          TextFieldCustom(icono: Icons.av_timer_outlined , type: TextInputType.number,texto: 'Edad' ),
          SizedBox(height: 20),
          TextFieldCustom(icono: Icons.female, type: TextInputType.number,texto: 'Sexo' ),
          SizedBox(height: 20),
         TextFieldCustom(icono: Icons.attribution_outlined , type: TextInputType.number,texto: 'Padecimiento' ),
          SizedBox(height: 20),

          
        ],
      ),
    );
  }
}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [

          
          //TextButton(
           // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginTenPage())),
           // child: Text('SIGN IN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          //),

          Text('/', style: TextStyle(fontSize: 25, color: Colors.grey)),
          
          TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegistroPage())),
            child: Text('Registro', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black))
          )

        ],
      ),
    );
  }
}