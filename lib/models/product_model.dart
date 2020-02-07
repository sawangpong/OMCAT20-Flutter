class ProductModel {

  // Field 
  String name;
  String detail;
  String pathImage;
  String image;

  // Method 

  // constructor
  ProductModel(this.name, this.detail, this.pathImage);

  ProductModel.fromMap(Map<String, dynamic> map){

    name = map['Name'];
    detail = map['Detail'];
    image = map['Image'];
    pathImage = map['PathImage'];
  }
}