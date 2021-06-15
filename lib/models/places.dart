import 'package:flutter/foundation.dart';

class Place {
  final String id;
  final String name;
  final String country;
  final PlaceCategories category;
  final int noOfFlights;
  final String flightTime;
  final String totalDistance;
  final String image;

  Place({
    @required this.id,
    @required this.name,
    @required this.country,
    @required this.category,
    @required this.noOfFlights,
    @required this.flightTime,
    @required this.totalDistance,
    @required this.image,
  });

}

enum PlaceCategories {
  Popular,
  SunSea,
  Adventure,
  Silence,
}