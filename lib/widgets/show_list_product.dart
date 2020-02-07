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
    // implement initState
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

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Image.network(
        productModels[index].pathImage,
        scale: 1.0,
      ),
    );
  }

  Widget showName(int index) {
    return Text(
      productModels[index].name.trim(),
      style: TextStyle(
        color: Colors.blue.shade900,
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
  }

  Widget showDetail(int index) {
    String detailStr = productModels[index].detail;

    if (detailStr.length > 100) {
      detailStr = detailStr.substring(0, 100);
      detailStr = '$detailStr....';
    }

    return Text(
      detailStr,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.brown,
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: <Widget>[
          showName(index),
          showDetail(index),
        ],
      ),
    );
  }

  Widget showListView(int index) {
    return Row(
      children: <Widget>[
        showImage(index),
        showText(index),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: productModels.length,
        itemBuilder: (BuildContext context, int index) {
          return showListView(index);
        },
      ),
    );
  }
}
