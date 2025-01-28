import 'package:flutter/material.dart';
import 'package:introduction/routes/routes.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }*/

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.account_box)],
        title: const Text(
          "BIENVENUE",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Veuillez saisir votre prénom" : '',
                controller: _prenomController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Prénom"),
                  hintText: "Entrez votre prénom",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "Veuillez saisir votre nom" : null,
                controller: _nomController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nom"),
                  hintText: "Entrez votre nom",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) => isValidEmail(value!)
                    ? null
                    : "Veuillez saisir un email valide",
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                  hintText: "Entrez votre mail",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate()
                      ? saveInfos()
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              showCloseIcon: true,
                              backgroundColor: Colors.red,
                              content: Text(
                                "Veuillez remplir tous les champs",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )));
                },
                child: const Text("Enregistrer"),
              )
            ],
          ),
        ),
      ),
      drawer: drawer(),
      floatingActionButton: floatingActionButton(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () => print("pressed"),
      backgroundColor: Colors.teal,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.teal,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "Options"),
      ],
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text("MOUHAMED DIOP"),
          ),
          ListTile(
            title: Text("Paramètre"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("Paramètre"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("Paramètre"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("Paramètre"),
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  saveInfos() {
    Map<String, String> datas = {
      "prenom": _prenomController.text,
      "nom": _nomController.text,
      "email": _emailController.text
    };
    _prenomController.clear();
    _nomController.clear();
    _emailController.clear();
    Navigator.pushNamed(context, NavigationRoutes.infosView, arguments: datas);
  }

  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }
}
