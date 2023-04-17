import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:minhhung2556/index.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final repository = DataRepository();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeEventInitial) {
        final data = await repository.getLatestProfile();
        if (data != null) {
          emit(HomeDoneLoadingState(data: data));
        }
      }
    });
  }
}
