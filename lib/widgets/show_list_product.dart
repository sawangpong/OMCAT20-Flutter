import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:omcat20/models/product_model.dart';

class ShowListProduct extends StatefulWidget {
  @override
  _ShowListProductState createState() => _ShowListProductState();
}

class _ShowListProductState extends State<ShowListProduct> {
  // Field
  List<ProductModel> productModels = List();

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    // read data from firestore
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Product');
    await collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        ProductModel productModel = ProductModel.fromMap(snapshot.data);
        setState(() {
          productModels.add(productModel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: productModels.length,
        itemBuilder: (BuildContext context, int index) {
            return Dismissible(key: Key(productModels[index].name), child: null);

          //return  Text(productModels[index].name);
        },
      ),
    );
  }
}
