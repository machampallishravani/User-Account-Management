import 'package:act_management/api.dart';
import 'package:act_management/cat_items_model.dart';
import 'package:dio/dio.dart';

class CatRepo {
  API api = API();
  Future<CatItemsModel> getCategoryItems() async {
    try {
      var uri = Uri.encodeFull('categories/allcategoriesuser');
      Response response = await api.sendRequest.get(uri);
      if (response.statusCode == 200) {
        return CatItemsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
