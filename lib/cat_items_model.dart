class CatItemsModel {
  int? status;
  List<Categories>? categories;

  CatItemsModel({this.status, this.categories});

  CatItemsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status'] = status;
    if (categories != null) {
      data['Categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? categoryID;
  String? categoryName;
  String? imageUrl;

  Categories({this.categoryID, this.categoryName, this.imageUrl});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryID = json['CategoryID'];
    categoryName = json['CategoryName'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryID'] = this.categoryID;
    data['CategoryName'] = this.categoryName;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }
}
