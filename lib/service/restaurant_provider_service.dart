import 'package:chopper/chopper.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/service/restaurant_model_converter.dart';

part 'restaurant_provider_service.chopper.dart';

@ChopperApi()
abstract class RestaurantProviderService extends ChopperService{
  static RestaurantProviderService create(){
    final client = ChopperClient(
      baseUrl: 'assets/',
      services: [
        _$RestaurantProviderService(),
      ],
      interceptors: [HttpLoggingInterceptor()],
      converter: RestaurantModelConverter(),
      errorConverter: JsonConverter(),
    );

    return _$RestaurantProviderService(client);
  }

  @Get(path: 'local_restaurant.json')
  Future<Response<RestaurantModel>> getRestaurants();
}