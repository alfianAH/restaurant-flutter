import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

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
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _listItem(context);
                  },
                ),
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

  Widget _listItem(BuildContext context){
    ThemeData themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: (){},
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
                      'https://restaurant-api.dicoding.dev/images/medium/14',
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
                        'Lorem ipsum',
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
                            'Lorem ipsum',
                            style: themeData.textTheme.bodyText2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          // Restaurant stars
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Color(0xFFFFE923),
                                size: 24,
                              ),

                              SizedBox(width: 8,),

                              Text(
                                '5.0',
                                style: themeData.textTheme.bodyText2,
                              )
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 8,),

                      // Restaurant description
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
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