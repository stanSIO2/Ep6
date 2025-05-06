import 'package:flutter/material.dart';

void main() {
  runApp(const MyNotificationPage(title: '',));
}

class MyNotificationPage extends StatefulWidget {
  const MyNotificationPage({super.key, required this.title});
  final String title;

  @override
  State<MyNotificationPage> createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<MyNotificationPage> {
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

class MyNotification extends StatefulWidget {
  const MyNotification({super.key, required String title});

  @override
  _MyNotificationState createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  // Liste simulée de notifications.
  List<Map<String, dynamic>> notifications = [
    {"id": 1, "type": "Commande", "message": "Nouvelle commande reçue (ID: 123)", "date": "2025-01-10 09:00"},
    {"id": 2, "type": "Stock", "message": "Stock faible pour Produit A", "date": "2025-01-10 10:30"},
    {"id": 3, "type": "Catalogue", "message": "Mise à jour du catalogue effectuée", "date": "2025-01-10 11:15"},
    {"id": 4, "type": "Commande", "message": "Nouvelle commande reçue (ID: 124)", "date": "2025-01-10 12:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications Administratives"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Exemple : inverser la liste pour simuler un rafraîchissement.
              setState(() {
                notifications = notifications.reversed.toList();
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          IconData iconData;
          Color iconColor;
          // Définir l'icône en fonction du type de notification.
          switch (notification['type']) {
            case "Commande":
              iconData = Icons.shopping_cart;
              iconColor = Colors.blue;
              break;
            case "Stock":
              iconData = Icons.inventory;
              iconColor = Colors.orange;
              break;
            case "Catalogue":
              iconData = Icons.update;
              iconColor = Colors.green;
              break;
            default:
              iconData = Icons.info;
              iconColor = Colors.grey;
          }
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(iconData, color: iconColor, size: 36),
              title: Text(notification['message'], style: TextStyle(fontSize: 16)),
              subtitle: Text(notification['date']),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    notifications.removeAt(index);
                  });
                },
              ),
              onTap: () {
                // Eventuellement, naviguer vers une page de détails ou marquer comme lue.
              },
            ),
          );
        },
      ),
    );
  }
}