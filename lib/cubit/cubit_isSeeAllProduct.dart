import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes/cubit/states.dart';

class SeeAllProduct extends Cubit<IsSeeAllProductState> {
  SeeAllProduct() : super(const InitialIsSeeAllProductState());

  void toggleGridView() {
    emit(SuccessIsSeeAllProductState(
      isSeeAllProductGridView: !state.isSeeAllProductGridView,
      isSeeAllProductListView: state.isSeeAllProductListView,
    ));
  }

  void toggleListView() {
    emit(SuccessIsSeeAllProductState(
      isSeeAllProductGridView: state.isSeeAllProductGridView,
      isSeeAllProductListView: !state.isSeeAllProductListView,
    ));
  }
}


