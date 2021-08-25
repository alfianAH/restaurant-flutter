import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/template/icon_text.dart';

class DetailPage extends StatelessWidget{
  final List<String> list = ['Lorem', 'Lorem'];

  TextTheme _textTheme(BuildContext context){
    return Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              // Title
              _detailTitle(context),

              // Restaurant Photo
              _restaurantPhoto(context),

              // Restaurant city and stars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Restaurant city
                  _restaurantCity(context),

                  // Restaurant stars
                  _restaurantStars(context),
                ],
              ),

              SizedBox(height: 16),

              // Restaurant description
              _restaurantDetail(context),

              // Restaurant Menus
              _restaurantMenus(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Build Detail Page title
  /// Consist of title and divider
  Widget _detailTitle(BuildContext context){
    return Column(
      children: [
        IconText(
          // Title
          text: Text(
            'Lorem Ipsum',
            style: _textTheme(context).headline5
          ),
          // Back Button
          iconButton: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            )
          ),
        ),

        SizedBox(height: 8),

        Divider(
          color: _textTheme(context).headline6!.color,
          thickness: 2,
        ),

        SizedBox(height: 16),
      ]
    );
  }

  /// Build Detail Photo
  Widget _restaurantPhoto(BuildContext context){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 350,
            child: Image.network(
              'https://restaurant-api.dicoding.dev/images/medium/14',
            ),
          ),
        ),

        SizedBox(height: 8),
      ],
    );
  }

  /// Restaurant city widget
  Widget _restaurantCity(BuildContext context){
    return IconText(
      text: Text(
        'Restaurant city',
        style: _textTheme(context).subtitle1,
      ),
      icon: Icon(
        Icons.location_city_rounded,
      ),
    );
  }

  /// Restaurant stars widget
  Widget _restaurantStars(BuildContext context){
    return IconText(
      text: Text(
        '5.0',
        style: _textTheme(context).subtitle1,
      ),
      icon: Icon(
        Icons.star_rounded,
        color: Color(0xFFFFE923),
        size: 24,
      ),
    );
  }

  /// Restaurant detail widget
  Widget _restaurantDetail(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconText(
          text: Text(
            'Description',
            style: _textTheme(context).headline6
          ),

          icon: Icon(
            Icons.description_rounded,
          ),
        ),

        Divider(
          color: _textTheme(context).headline6!.color,
          thickness: 2,
        ),

        SizedBox(height: 8),

        Text(
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.',
          style: _textTheme(context).bodyText1
        ),

        SizedBox(height: 16),
      ],
    );
  }

  /// Restaurant Menus widget
  Widget _restaurantMenus(BuildContext context){
    return Column(
      children: [
        IconText(
          text: Text(
            'Menus',
            style: _textTheme(context).headline6
          ),

          icon: Icon(
            Icons.menu_book_rounded,
          ),
        ),

        Divider(
          color: _textTheme(context).headline6!.color,
          thickness: 2,
        ),

        SizedBox(height: 8),

        // Menu
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Foods
            _buildMenu(
              context,
              IconText(
                text: Text(
                  'Foods',
                  style: _textTheme(context).subtitle2,
                ),
                icon: Icon(
                  Icons.lunch_dining_rounded,
                ),
              ),
              list,
            ),

            // Drinks
            _buildMenu(
              context,
              IconText(
                text: Text(
                  'Drink',
                  style: _textTheme(context).subtitle2,
                ),
                icon: Icon(
                  Icons.coffee_rounded,
                ),
              ),
              list,
            ),
          ],
        )
      ]
    );
  }

  /// Template for food and drink menu
  Widget _buildMenu(BuildContext context, IconText iconText, List menuList){
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title
            iconText,

            SizedBox(height: 8),

            // List
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Text(
                  '\u2022 ${list[index]}',
                  style: _textTheme(context).bodyText2,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}