import 'package:flutter/material.dart';

class MyStockPage extends StatefulWidget {
  final String title;
  const MyStockPage({super.key, required this.title});

  @override
  _MyStockPageState createState() => _MyStockPageState();
}

class _MyStockPageState extends State<MyStockPage> {
  // Exemple de liste de produits en stock
  List<Map<String, dynamic>> produits = [
    {'id': 1, 'nom': 'Produit A', 'quantite': 10, 'prix': 100.0},
    {'id': 2, 'nom': 'Produit B', 'quantite': 5, 'prix': 150.0},
    {'id': 3, 'nom': 'Produit C', 'quantite': 8, 'prix': 200.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestion du Stock')),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          final produit = produits[index];
          return Card(
            child: ListTile(
              title: Text(produit['nom']),
              subtitle: Text('Quantité: ${produit['quantite']} - Prix: \$${produit['prix']}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Naviguer vers une page de détail du produit
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StockDetailPage(produit: produit),
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

/// Page de détail d'un produit
class StockDetailPage extends StatelessWidget {
  final Map<String, dynamic> produit;

  StockDetailPage({required this.produit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail du Produit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom: ${produit['nom']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Quantité: ${produit['quantite']}"),
            SizedBox(height: 10),
            Text("Prix: \$${produit['prix']}"),
            SizedBox(height: 20),
            ElevatedButton(
            child: Text("Modifier la Quantité"),
            onPressed: () async {
              String? input = await showDialog<String>(
                context: context,
                builder: (context) {
                  String tempQuantity = produit['quantite'].toString();
                  return AlertDialog(
                    title: Text("Modifier la Quantité"),
                    content: TextField(
                      decoration: InputDecoration(labelText: "Nouvelle quantité"),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        tempQuantity = value;
                      },
                      controller: TextEditingController(
                          text: produit['quantite'].toString()),
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
                          Navigator.of(context).pop(tempQuantity);
                        },
                      ),
                    ],
                  );
                },
              );
              if (input != null && int.tryParse(input) != null) {
                int newQuantity = int.parse(input);
                Navigator.pop(context, {'action': 'update', 'quantite': newQuantity});
              }
            },
          ),
            ElevatedButton(
            child: Text("Supprimer le Produit"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              bool? confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Confirmer la suppression"),
                  content: Text("Voulez-vous supprimer ce produit ?"),
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

/// Page d'ajout d'un produit au stock
class AddProduitPage extends StatefulWidget {
  @override
  _AddProduitPageState createState() => _AddProduitPageState();
}

class _AddProduitPageState extends State<AddProduitPage> {
  final _formKey = GlobalKey<FormState>();
  late String nom;
  late int quantite;
  late double prix;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter un Produit")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nom du Produit"),
                validator: (val) => val!.isEmpty ? "Veuillez entrer un nom" : null,
                onSaved: (val) => nom = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Quantité"),
                keyboardType: TextInputType.number,
                validator: (val) => val!.isEmpty ? "Veuillez entrer la quantité" : null,
                onSaved: (val) => quantite = int.tryParse(val!) ?? 0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Prix"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (val) => val!.isEmpty ? "Veuillez entrer le prix" : null,
                onSaved: (val) => prix = double.tryParse(val!) ?? 0.0,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Valider"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Ici, vous pouvez ajouter la logique pour enregistrer le nouveau produit.
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