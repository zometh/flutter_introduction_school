import 'package:flutter/material.dart';

class InfosView extends StatelessWidget {
  static const String routeName = '/infos_view';

  const InfosView({super.key});

  @override
  Widget build(BuildContext context) {
    final datas = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informations de l'utilisateur",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
           displayInfosRow("Prénom", datas["prenom"]),
           displayInfosRow("Nom", datas["nom"]),
           displayInfosRow("Adresse email", datas["email"])
           
          ],
        ),
      ),
    );
  }

  Row displayInfosRow(String titre, String valeur) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        title(
          "$titre: ",
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        title(valeur),
      ],
    );
  }

  Widget title(String value,
      {FontWeight fontWeight = FontWeight.normal, double fontSize = 16}) {
    return Text(
      value,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
