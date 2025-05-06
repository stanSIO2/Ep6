import 'package:flutter/material.dart';

void main() {
  runApp(const MyCataloguePage(title: '',));
}

class MyCataloguePage extends StatefulWidget {
  const MyCataloguePage({super.key, required this.title});
  final String title;

  @override
  State<MyCataloguePage> createState() => _MyCataloguePageState();
}

class _MyCataloguePageState extends State<MyCataloguePage> {

  
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

class MyCatalogue extends StatelessWidget {
  const MyCatalogue({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    AppBar(title: const Text('Gestion du catalogue'));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogue App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductCatalogue(),
    );
  }
}

class Product {
  final String name;
  final String description;

  Product({
    required this.name,
    required this.description,
  });
}

class ProductCatalogue extends StatefulWidget {
  const ProductCatalogue({super.key});

  @override
  State<ProductCatalogue> createState() => _ProductCatalogueState();
}

class _ProductCatalogueState extends State<ProductCatalogue> {
  final List<Product> products = [
    Product(
      name: 'Clip Vidéo',
      description: 'Montage de clips vidéo pour les réseaux sociaux',
    ),
    Product(
      name: 'Vidéo Commerciale',
      description: 'Montage de vidéo commerciale pour les influenceurs sur les réseaux sociaux',
    ),
    Product(
      name: 'Vidéo Promotionnelle',
      description: 'Montage de vidéo promotionnelle pour les marques sur les réseaux sociaux',
    ),
    Product(
      name: 'Podcast voyage',
      description: 'Montage de vidéo ou audio Podcast pour les réseaux sociaux, YouTube, plateforme de streaming...',
    ),
    Product(
      name: 'Documentaire voyage',
      description: 'Réalisation et / ou Montage de Documentaire pour YouTube ou autre plateforme de streaming...',
    ),
    Product(
      name: 'Vidéo éducative',
      description: 'Réalisation et / ou Montage de Vidéo éducative pour les réseaux sociaux, YouTube...',
    ),
  ];

  final List<Product> cart = [];

  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
  }

   void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue de Produits',),),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.description),
              onTap: () => addToCart(product),
            ),
          );
        },
      ),
    );
  }
}