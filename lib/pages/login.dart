import 'package:flutter/material.dart';

import 'package:logginprop/pages/registro.dart';

import 'package:logginprop/Widgets/Header.dart';
import 'package:logginprop/Widgets/Logo.dart';
import 'package:logginprop/Widgets/TextFieldCustom.dart';


class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
         padding: EdgeInsets.only(top:0),
         physics: BouncingScrollPhysics(),
         children: [

            Stack(
              children: [

                HeaderLogin(),
                
                LogoHeader()
              ],
            ),

            _Titulo(),

            SizedBox(height: 40),

            _EmailAndPassword(),

            _ForgotPassword(),

            SizedBox(height: 40),

            _BottonSignIn()
         ],
       )
     );
  }
}

class _BottonSignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(50)
      ),
      child: TextButton(
        child: Text('INICIAR SESIÓN', style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: (){},
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25, top: 20),
      alignment: Alignment.centerRight,
      child: Text('¿Olvidaste tu contraseña?'),
    );
  }
}

class _EmailAndPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      child: Column(
        children: [

          TextFieldCustom (icono: Icons.person, type: TextInputType.emailAddress,texto: 'Usuario' ),
          SizedBox(height: 20),
          TextFieldCustom (icono: Icons.visibility_off, type: TextInputType.text, pass: true, texto: 'Contraseña'),
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

          Text('Iniciar Sesión ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

          Text('/', style: TextStyle(fontSize: 25, color: Colors.grey)),
          
          TextButton(
           onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegistroPage())),
           child: Text('Registrarse', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey))
          )

        ],
      ),
    );
  }
}