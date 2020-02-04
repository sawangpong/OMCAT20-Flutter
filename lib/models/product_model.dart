class ProductModel {

  // Field 
  String name;
  String detail;
  String pathImage;

  // Method 

  // constructor
  ProductModel(this.name, this.detail, this.pathImage);

  ProductModel.fromMap(Map<String, dynamic> map){

    name = map['Name'];
    detail = map['Detail'];
    pathImage = map['PathImage'];
  }
}