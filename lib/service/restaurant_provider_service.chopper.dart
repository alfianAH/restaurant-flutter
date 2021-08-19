// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_provider_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$RestaurantProviderService extends RestaurantProviderService {
  _$RestaurantProviderService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestaurantProviderService;

  @override
  Future<Response<RestaurantModel>> getRestaurants() {
    final $url = 'local_restaurant.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<RestaurantModel, RestaurantModel>($request);
  }
}
