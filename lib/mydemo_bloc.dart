import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mydemo_event.dart';
part 'mydemo_state.dart';

class MydemoBloc extends Bloc<MydemoEvent, MydemoState> {
  MydemoBloc() : super(MydemoInitial(0)) {
    int? cnt;

    on<MydemoEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IntialEvent>((event, emit) {
      cnt = event.i;
      emit(MydemoInitial(cnt!));
    });

    on<Increment>((event, emit) {
      cnt = cnt! + 1;

      emit(MydemoInitial(cnt!));
    });

    on<Decreent>((event, emit)  {
      cnt = cnt! - 1;
      emit(MydemoInitial(cnt!));

    });
  }
}
