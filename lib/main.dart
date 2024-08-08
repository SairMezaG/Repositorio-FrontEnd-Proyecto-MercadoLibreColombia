import 'package:flutter/material.dart';
import 'screens/menuPrincipal.dart';
import 'screens/incicioDeSesion.dart';
import 'screens/registroDeUsuarios.dart';
import 'screens/perfilUsuario.dart';
import 'screens/compras.dart';
import 'screens/administrarUsuarios.dart';


void main() {
  runApp(const MercadoLibre());
}

class MercadoLibre extends StatelessWidget {
  const MercadoLibre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPrincipal(),
        '/inicioSesion': (context) => const InicioSesion(),
        '/registro': (context) => const FormularioRegistro(),
        '/perfil': (context) => const PerfilUsuario(),
        '/compras': (context) => const Compras(),
        '/administrarUsuarios': (context) => const AdministrarUsuarios(),
      },
    );
  }
}

