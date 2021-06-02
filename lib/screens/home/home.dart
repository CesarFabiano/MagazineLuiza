import 'package:flutter/material.dart';
import 'package:magazine_luiza/models/product.dart';
import 'package:magazine_luiza/provider/products.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.jpg"),
        title: Text("Ofertas do dia"),
        backgroundColor: Color(0xFF0083cb),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/linha.jpg"),
          Expanded(
            child: ListView.builder(
              itemBuilder: builder,
              itemCount: listOfProducts.length,
            ),
          ),
        ],
      ),
    );
  }

//Image.asset("assets/images/linha.jpg"),
  Widget builder(BuildContext context, int index) {
    Product _product = listOfProducts.elementAt(index);
    final double parceledPrice = _product.price / _product.parcel;
    final formatter = new NumberFormat("#,##0.00", "pt_BR");
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Row(
          children: [
            Image.asset(
              _product.photo,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _product.descripition,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "R\$ ${formatter.format(_product.price)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0083cb),
                      ),
                    ),
                    Text(
                      "${_product.parcel}x de R\$ ${formatter.format(parceledPrice)} sem juros",
                      style: TextStyle(
                        color: Color(0xFF0083cb),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          (_product.isFavorite) ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 20,
        ),
        onPressed: () {
          setState(() {
            _product.isFavorite = !_product.isFavorite;
          });
        },
      ),
    );
  }
}
