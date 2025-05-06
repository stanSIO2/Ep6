import 'package:flutter/material.dart';

class MyCommandePage extends StatefulWidget {
  final dynamic title;

  @override
  _MyCommandePageState createState() => _MyCommandePageState();
  const MyCommandePage({super.key, required this.title});
}

class _MyCommandePageState extends State<MyCommandePage> {
  // Exemple de liste de commandes avec des informations supplémentaires.
  List<Map<String, dynamic>> commandes = [
    {'id': 1, 'nom': 'Commande 1', 'date': '2025-01-01', 'status': 'En cours'},
    {'id': 2, 'nom': 'Commande 2', 'date': '2025-01-05', 'status': 'Livrée'},
    {'id': 3, 'nom': 'Commande 3', 'date': '2025-01-10', 'status': 'Annulée'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestion des Commandes')),
      body: ListView.builder(
        itemCount: commandes.length,
        itemBuilder: (context, index) {
          final commande = commandes[index];
          return Card(
            child: ListTile(
              title: Text(commande['nom']),
              subtitle: Text('Date: ${commande['date']} - Statut: ${commande['status']}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Naviguer vers une page de détail de commande
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CommandeDetailPage(commande: commande),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// Page de détail d'une commande
class CommandeDetailPage extends StatelessWidget {
  final Map<String, dynamic> commande;

  CommandeDetailPage({required this.commande});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail de la Commande'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom: ${commande['nom']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Date: ${commande['date']}"),
            SizedBox(height: 10),
            Text("Statut: ${commande['status']}"),
            SizedBox(height: 20),
            ElevatedButton(
            child: Text("Modifier le Statut"),
            onPressed: () async {
              String? newStatus = await showDialog<String>(
                context: context,
                builder: (context) {
                  String tempStatus = commande['status'];
                  return AlertDialog(
                    title: Text("Modifier le Statut"),
                    content: TextField(
                      decoration: InputDecoration(labelText: "Nouveau statut"),
                      onChanged: (value) {
                        tempStatus = value;
                      },
                      controller: TextEditingController(text: commande['status']),
                    ),
                    actions: [
                      TextButton(
                        child: Text("Annuler"),
                        onPressed: () {
                          Navigator.of(context).pop(null);
                        },
                      ),
                      ElevatedButton(
                        child: Text("Valider"),
                        onPressed: () {
                          Navigator.of(context).pop(tempStatus);
                        },
                      ),
                    ],
                  );
                },
              );
              if (newStatus != null && newStatus.trim().isNotEmpty) {
                Navigator.pop(context, {
                  'action': 'update',
                  'status': newStatus.trim(),
                });
              }
            },
          ),
            ElevatedButton(
            child: Text("Supprimer la Commande"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              bool? confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Confirmer la suppression"),
                  content: Text("Voulez-vous supprimer cette commande ?"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Annuler")),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text("Supprimer"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
                  ],
                ),
              );
              if (confirm == true) {
                Navigator.pop(context, {'action': 'delete'});
              }
            },
          ),

          ],
        ),
      ),
    );
  }
}

/// Page d'ajout d'une commande
class AddCommandePage extends StatefulWidget {
  @override
  _AddCommandePageState createState() => _AddCommandePageState();
}

class _AddCommandePageState extends State<AddCommandePage> {
  final _formKey = GlobalKey<FormState>();
  late String nom, date, status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter une Commande")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nom de la Commande"),
                validator: (val) => val!.isEmpty ? "Veuillez entrer un nom" : null,
                onSaved: (val) => nom = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Date (YYYY-MM-DD)"),
                validator: (val) => val!.isEmpty ? "Veuillez entrer une date" : null,
                onSaved: (val) => date = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Statut"),
                validator: (val) => val!.isEmpty ? "Veuillez entrer le statut" : null,
                onSaved: (val) => status = val!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Valider"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Ici vous pouvez ajouter la logique d'enregistrement de la commande.
                    // Par exemple, envoyer la nouvelle commande vers une API ou l'ajouter à une liste.
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}