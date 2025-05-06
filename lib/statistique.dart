import 'package:flutter/material.dart';

void main() {
  runApp(const MyStatistiquePage(title: '',));
}

class MyStatistiquePage extends StatefulWidget {
  const MyStatistiquePage({super.key, required this.title});
  final String title;

  @override
  State<MyStatistiquePage> createState() => _MyStatistiquePageState();
}

class _MyStatistiquePageState extends State<MyStatistiquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avventura"),
      ),
      body: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.all(150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ça fonctionne !")
            ],
          )
        )
      )
    );
  }
}

class MyStatistique extends StatelessWidget {
  const MyStatistique({super.key, required String title});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 2 onglets : Ventes et Popularité
      child: Scaffold(
        appBar: AppBar(
          title: Text("Statistiques et Rapports"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Rapport de Ventes", icon: Icon(Icons.euro)),
              Tab(text: "Popularité", icon: Icon(Icons.star)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SalesReportTab(),
            PopularityAnalysisTab(),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

/// Onglet Rapport de Ventes
class SalesReportTab extends StatelessWidget {
  // Données simulées pour le rapport de ventes.
  final List<Map<String, dynamic>> salesData = [
    {"date": "2025-01-01", "total": 1500},
    {"date": "2025-01-02", "total": 1800},
    {"date": "2025-01-03", "total": 2100},
    {"date": "2025-01-04", "total": 1300},
    {"date": "2025-01-05", "total": 1600},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        const Card(
          elevation: 4,
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Rapport de Ventes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...salesData.map((data) => Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.blue),
                title: Text("Date: ${data['date']}"),
                subtitle: Text("Total Ventes: \$${data['total']}"),
              ),
            )),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton.icon(
              onPressed: () {
                // Simule le téléchargement du fichier
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Téléchargement du rapport...')),
                );
              },
              icon: Icon(Icons.download),
              label: Text('Télécharger le rapport'),
            ),
        ),
      ],
    );
  }
}

/// Onglet Analyse de Popularité
class PopularityAnalysisTab extends StatelessWidget {
  // Données simulées pour l'analyse de popularité des articles.
  final List<Map<String, dynamic>> productPopularity = [
    {"product": "Produit A", "sales": 300},
    {"product": "Produit B", "sales": 450},
    {"product": "Produit C", "sales": 250},
    {"product": "Produit D", "sales": 500},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          elevation: 4,
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Analyse de Popularité",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...productPopularity.map((product) => Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("${product['product']}"),
                subtitle: Text("Ventes: ${product['sales']}"),
              ),
            )),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              // Implémentez ici la logique de rafraîchissement des données.
            },
            icon: Icon(Icons.refresh),
            label: Text("Rafraîchir les Données"),
          ),
        ),
      ],
    );
  }
}