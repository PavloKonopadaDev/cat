import 'package:cat_fact_2/model/model.dart';
import 'package:cat_fact_2/service.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';

class CatRepository {
  Box<CatFact>? _catFactBox;

  CatRepository(ApiService apiService) {
    Hive.openBox<CatFact>('cat_facts').then((box) {
      _catFactBox = box;
    });
  }

  Future<CatFact> getRandomCatFact() async {
    final apiService = ApiService(Dio());
    final response = await apiService.getRandomCatFact();
    final catFact = CatFact.fromJson(response);
    _catFactBox?.add(catFact);
    return catFact;
  }

  List<CatFact> getAllCatFacts() {
    return _catFactBox?.values.toList() ?? [];
  }
}
