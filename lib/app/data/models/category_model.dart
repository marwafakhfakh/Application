import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Category {
  int? id;
  String? name;
  String? departement;
  String? image;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.name,
      this.departement,
      this.image,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departement = json['departement'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  //get imagePath => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['departement'] = this.departement;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }


  static fromMap(Category categoryMap) {}
}


//AddCategory


AddCategory addCategoryFromJson(String str) => AddCategory.fromJson(json.decode(str));

String addCategoryToJson(AddCategory data) => json.encode(data.toJson());

class AddCategory {
    
    String name;
    String departement;
    String image;

    AddCategory({
     
        required this.name,
        required this.departement,
        required this.image,
    });

    factory AddCategory.fromJson(Map<String, dynamic> json) => AddCategory(
       // titre: DateTime.parse(json["titre"]),
        name:json["name"],
        departement: json["departement"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        //"titre": "${titre.year.toString().padLeft(4, '0')}-${titre.month.toString().padLeft(2, '0')}-${titre.day.toString().padLeft(2, '0')}",
        "name":name,
        "departement": departement,
        "image": image,
    };
}