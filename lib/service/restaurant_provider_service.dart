import 'package:restaurant_app/data/model/restaurant_model.dart';

abstract class RestaurantProviderService{
  // static RestaurantProviderService create(){
  //
  // }

  Future<RestaurantModel> getRestaurants();
}