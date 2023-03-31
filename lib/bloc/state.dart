import 'package:cat_fact_2/model/model.dart';

abstract class CatState {}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final CatFact catFact;

  CatLoaded(this.catFact);
}

class CatError extends CatState {
  final String message;

  CatError(this.message);
}
