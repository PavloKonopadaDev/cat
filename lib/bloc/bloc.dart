import 'package:bloc/bloc.dart';
import 'package:cat_fact_2/bloc/event.dart';
import 'package:cat_fact_2/bloc/state.dart';
import 'package:cat_fact_2/repository/repository.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository catRepository;

  CatBloc(this.catRepository) : super(CatInitial());

  @override
  Stream<CatState> mapEventToState(CatEvent event) async* {
    if (event is FetchCatFact) {
      yield CatLoading();

      try {
        final catFact = await catRepository.getRandomCatFact();

        yield CatLoaded(catFact);
      } catch (e) {
        yield CatError('Failed to fetch cat fact');
      }
    }
  }
}
