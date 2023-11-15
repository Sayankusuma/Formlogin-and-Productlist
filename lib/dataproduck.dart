import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.description,
  });
}

class MyApp extends StatelessWidget {
  final List<Product> products = List.generate(10, (index) {
    return Product(
      name: 'Dress ${index + 1}', // Ubah nama produk menjadi "Dress"
      price: (index + 1) * 10.0,
      description: 'Description of Dress ${index + 1}', // Ubah deskripsi produk
    );
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(products[index].name),
              subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Tambahkan aksi yang diinginkan saat tombol hapus ditekan
                  print('Hapus ${products[index].name}');
                },
              ),
              onTap: () {
                // Tambahkan aksi yang diinginkan saat produk ditekan
                print('Ditekan pada ${products[index].name}');
              },
            );
          },
        ),
      ),
    );
  }
}
