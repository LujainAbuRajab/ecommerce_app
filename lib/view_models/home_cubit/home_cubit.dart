// import 'package:ecommerce_app/models/announcement_model.dart';
// import 'package:ecommerce_app/models/product_item_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// //import 'package:meta/meta.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
// }

// void getHomeData() async {
//     emit(HomeLoading());
//     try {
//       final products = dummyProducts;
//       final announcements = dummyAnnouncements;
//       emit(HomeLoaded(products, announcements));
//     } catch (e) {
//       emit(HomeError(e.toString()));
//     }
//   }

import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getHomeData() async {
    emit(HomeLoading());
    try {
      final products = dummyProducts;
      final announcements = dummyAnnouncements;
      emit(HomeLoaded(products, announcements));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
