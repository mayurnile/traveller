import 'package:flutter/material.dart';

import '../models/places.dart';

class PlaceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context).settings.arguments;
    Place place = args[0];

    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: place.id,
            child: Container(
              margin: const EdgeInsets.all(12.0),
              width: screenSize.width,
              height: screenSize.height * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  place.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.14,
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        place.name,
                        style: textTheme.subtitle,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        place.country,
                        style: textTheme.body1,
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        '${place.noOfFlights} flights everyday',
                        style: textTheme.body1.copyWith(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  elevation: 12.0,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Text(
                    'Book Flight',
                    style: textTheme.button,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.1,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            //padding: const EdgeInsets.only(top : 15.0),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      place.flightTime,
                      style: textTheme.subtitle.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Direct Flight',
                      style: textTheme.body1.copyWith(color: Colors.white60),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${place.totalDistance}km',
                      style: textTheme.subtitle.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Total Distance',
                      style: textTheme.body1.copyWith(color: Colors.white60),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: Text(
              'Facts',
              style: textTheme.subtitle.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ipsum arcu, mattis a justo sit amet, ullamcorper tempus purus.',
                    textAlign: TextAlign.justify,
                    style: textTheme.subtitle.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ipsum arcu, mattis a justo sit amet, ullamcorper tempus purus.',
                    textAlign: TextAlign.justify,
                    style: textTheme.subtitle.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ipsum arcu, mattis a justo sit amet, ullamcorper tempus purus.',
                    textAlign: TextAlign.justify,
                    style: textTheme.subtitle.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ipsum arcu, mattis a justo sit amet, ullamcorper tempus purus.',
                    textAlign: TextAlign.justify,
                    style: textTheme.subtitle.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
