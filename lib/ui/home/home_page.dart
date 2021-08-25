import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/service/restaurant_provider_service.dart';
import 'package:restaurant_app/ui/detail/detail_page.dart';
import 'package:restaurant_app/ui/widgets/icon_text.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  TextTheme _textTheme(BuildContext context){
    return Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant',
                style: textTheme.headline5,
              ),

              SizedBox(height: 8),

              Divider(
                color: textTheme.headline6!.color,
                thickness: 2,
              ),

              SizedBox(height: 16),

              // Restaurant list
              Container(
                width: 500,
                child: _loadRestaurantList(context),
              ),
            ]
          ),
        ),
      ),
    );
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  Widget _loadRestaurantList(BuildContext context){
    return FutureBuilder<Response<RestaurantModel>>(
      future: Provider.of<RestaurantProviderService>(context).getRestaurants(),
      builder:(context, snapshot) {
        // If connection is done
        if(snapshot.connectionState == ConnectionState.done){
          // If snapshot has error
          if(snapshot.hasError){
            return Container(
              padding: const EdgeInsets.all(32),
              child: Text(
                snapshot.error.toString(),

              ),
            );
          }

          // Get data
          final restaurantModel = snapshot.data?.body;

          // If restaurant model is null, ...
          if(restaurantModel == null){
            return Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Failed to get response, because the data is null',
                style: _textTheme(context).bodyText1,
              ),
            );
          }

          // If there are response
          if(restaurantModel.restaurants!.length > 0){
            return ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: restaurantModel.restaurants!.length,
              itemBuilder: (context, index) {
                return _restaurantListItem(
                  context,
                  restaurantModel.restaurants![index]
                );
              },
            );
          }

          // Return Text if there are no responses
          return Container(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'There are no results',
              style: _textTheme(context).bodyText1,
            ),
          );
        } else{ // Else show loading
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  /// List of restaurants
  Widget _restaurantListItem(BuildContext context, Restaurants restaurant){
    ThemeData themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return DetailPage(
                restaurant: restaurant,
              );
            })
          );
        },
        child: Card(
          color: themeData.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant image
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                  ),
                  child: Container(
                    width: 140,
                    height: 140,
                    child: Image.network(
                      restaurant.pictureId.toString(),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),

              // Restaurant description
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Restaurant name
                      Text(
                        restaurant.name ?? '',
                        style: themeData.textTheme.subtitle1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Restaurant city and stars
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Restaurant city
                          Text(
                            restaurant.city ?? '',
                            style: themeData.textTheme.bodyText2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          // Restaurant stars
                          IconText(
                            text: Text(
                              restaurant.rating?.toStringAsFixed(1) ?? '',
                              style: themeData.textTheme.subtitle1,
                            ),
                            icon: Icon(
                              Icons.star_rounded,
                              color: Color(0xFFFFE923),
                              size: 24,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8,),

                      // Restaurant description
                      Text(
                        restaurant.description ?? '',
                        style: themeData.textTheme.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}