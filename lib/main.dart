import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projet_e5/catalogue.dart';
import 'package:projet_e5/commande.dart';
import 'package:projet_e5/notification.dart';
import 'package:projet_e5/statistique.dart';
import 'package:projet_e5/stock.dart';


void main() {
  runApp(const MyApp());
    false;
    const MyHomePage(title: '',);
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avventura',
      theme: ThemeData(primarySwatch: Colors.blue,),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Avventura'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  get style => null;

  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avventura"),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // Logo avec une image
              Container(
                margin: const EdgeInsets.only(top: 100.0),
                child: Image.asset(
                  'img/Avventura.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenue sur votre compte administrateur',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Créé chaque moments vos voyages avec Avventura.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Action pour le bouton "Commencer"
                            print('Se connecter appuyé');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => LoginForm(title : (widget.title))));
                            },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Connexion',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 80.0),
                        child: Text(
                          '© 2025 Votre Entreprise. Tous droits réservés.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 248, 248, 248),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? email, password;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulaire de connexion'),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo avec une image
              Container(
                margin: const EdgeInsets.only(top: 200.0),
                child: Image.asset(
                  'img/Avventura.png',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Adresse e-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || !value.contains('@')
                    ? 'Veuillez entrer une adresse e-mail valide'
                    : null,
                onSaved: (value) => email = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) => value == null || value.isEmpty
                    ? 'Veuillez entrer votre mot de passe'
                    : null,
                onSaved: (value) => password = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Traitez les données ici
                       print('Se connecter appuyé');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => MySecondPage(title : 'Seconde page')));
                    }
                  },
                child: const Text('Se connecter'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Text(
                  textAlign: TextAlign.center,
                  '© 2025 Avventura. Tous droits réservés.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key, required this.title});
  final String title;

  @override
  State<MySecondPage> createState() => _MySecondPageState();
  
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _MySecondPageState extends State<MySecondPage> {
  get style => null;

  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avventura - Navigation"),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenue sur le menu navigation !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Action pour le bouton "Commencer"
                            print('catalogue appuyé');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyCatalogue(title : (widget.title))));
                            },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Gestion du Catalogue',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action pour le bouton "Commencer"
                            print('commande appuyé');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyCommandePage(title : (widget.title))));
                            },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Gestion des commandes',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action pour le bouton "Commencer"
                            print('stock appuyé');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyStockPage(title : (widget.title))));
                            },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Gestion du Stock',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action pour le bouton "Commencer"
                            print('statistique appuyé');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyStatistique(title : (widget.title))));
                            },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Statistique et Rapports',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        )
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Action pour le bouton "Commencer"
                            print('notification appuyé');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyNotification(title : (widget.title))));
                            },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Notification administrative',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}