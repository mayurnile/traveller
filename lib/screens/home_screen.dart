import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/places.dart';
import '../models/dummy.dart';

import '../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PageController _listCardController_1,
      _listCardController_2,
      _listCardController_3,
      _listCardController_4;

  int _currentCard_1, _currentCard_2, _currentCard_3, _currentCard_4;

  List<Widget> _mainPages;

  var textTheme, screenSize, cardHeight, cardWidth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );

    _pageController = PageController(
      initialPage: 0,
    );

    _listCardController_1 = PageController(
      initialPage: 0,
      viewportFraction: 0.6,
    );

    _listCardController_2 = PageController(
      initialPage: 0,
      viewportFraction: 0.6,
    );

    _listCardController_3 = PageController(
      initialPage: 0,
      viewportFraction: 0.6,
    );

    _listCardController_4 = PageController(
      initialPage: 0,
      viewportFraction: 0.6,
    );

    _currentCard_1 = 0;
    _currentCard_2 = 0;
    _currentCard_3 = 0;
    _currentCard_4 = 0;
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    textTheme = Theme.of(context).textTheme;

    cardHeight = screenSize.height * 0.3;
    cardWidth = screenSize.height * 0.7;

    var reversePopularList = popularPlaces.reversed.toList();
    var reverseSunSeaList = sunandseaPlaces.reversed.toList();

    _mainPages = <Widget>[
      Container(
        height: screenSize.height * 0.6,
        width: screenSize.width,
        child: PageView.builder(
          controller: _listCardController_1,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: popularPlaces.length,
          onPageChanged: (index) {
            _currentCard_1 = index;
            setState(() {});
          },
          itemBuilder: (ctx, index) {
            bool isOdd = (index % 2) == 0 ? true : false;
            bool isActive = _currentCard_1 == index;
            return _buildCard(popularPlaces[index], isActive, isOdd);
          },
        ),
      ),
      Container(
        height: screenSize.height * 0.6,
        width: screenSize.width,
        child: PageView.builder(
          controller: _listCardController_2,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: sunandseaPlaces.length,
          onPageChanged: (index) {
            _currentCard_2 = index;
            setState(() {});
          },
          itemBuilder: (ctx, index) {
            bool isOdd = (index % 2) == 0 ? true : false;
            bool isActive = _currentCard_2 == index;
            return _buildCard(sunandseaPlaces[index], isActive, isOdd);
          },
        ),
      ),
      Container(
        height: screenSize.height * 0.6,
        width: screenSize.width,
        child: PageView.builder(
          controller: _listCardController_3,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: reversePopularList.length,
          onPageChanged: (index) {
            _currentCard_3 = index;
            setState(() {});
          },
          itemBuilder: (ctx, index) {
            bool isOdd = (index % 2) == 0 ? true : false;
            bool isActive = _currentCard_3 == index;
            return _buildCard(reversePopularList[index], isActive, isOdd);
          },
        ),
      ),
      Container(
        height: screenSize.height * 0.6,
        width: screenSize.width,
        child: PageView.builder(
          controller: _listCardController_4,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: reverseSunSeaList.length,
          onPageChanged: (index) {
            _currentCard_4 = index;
            setState(() {});
          },
          itemBuilder: (ctx, index) {
            bool isOdd = (index % 2) == 0 ? true : false;
            bool isActive = _currentCard_4 == index;
            return _buildCard(reverseSunSeaList[index], isActive, isOdd);
          },
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Traveller',
          style: textTheme.title,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelStyle: textTheme.display1,
            unselectedLabelStyle: textTheme.display2,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(horizontal: 36.0),
            tabs: [
              Tab(
                text: 'Popular',
              ),
              Tab(
                text: 'Sea & Sun',
              ),
              Tab(
                text: 'Adventure',
              ),
              Tab(
                text: 'Silence',
              ),
            ],
            onTap: (value) {
              _pageController.animateToPage(
                value,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 36.0,
            ),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                _tabController.index = value;
                _currentCard_1 = 0;
                _currentCard_2 = 0;
                _currentCard_3 = 0;
                _currentCard_4 = 0;
              },
              itemCount: _mainPages.length,
              itemBuilder: (ctx, index) => _mainPages[index],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardList() {}

  Widget _buildCard(Place place, bool isActive, bool isOdd) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.PLACE_DETAILS_SCREEN,
          arguments: [place],
        );
      },
      child: AnimatedContainer(
        height: cardHeight,
        width: cardWidth,
        duration: Duration(milliseconds: 500),
        curve: Cubic(0.1, 0.2, 0.1, 1.0),
        margin: EdgeInsets.only(
          top: 12.0,
          bottom: screenSize.height * 0.1,
          left: isActive ? 24.0 : screenSize.width * 0.15,
          right: 24.0,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: isOdd ? 8 : cardWidth * 0.36,
              right: isOdd ? cardWidth * 0.35 : 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Cubic(0.1, 0.2, 0.1, 1.0),
                    height: isActive ? cardHeight * 0.26 : cardHeight * 0.5,
                  ),
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
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Cubic(0.1, 0.2, 0.1, 1.0),
                    height: isActive ? cardHeight * 0.2 : cardHeight * 0.35,
                  ),
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
            ),
            Positioned(
              right: isOdd ? 0 : cardWidth * 0.3,
              left: isOdd ? cardWidth * 0.3 : 0,
              bottom: 0,
              top: 0,
              child: Container(
                height: cardHeight,
                width: cardWidth * 0.4,
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 2.0,
                ),
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      curve: Cubic(0.1, 0.2, 0.1, 1.0),
                      duration: Duration(milliseconds: 700),
                      left: isActive ? 0 : -56,
                      right: isActive ? 0 : -56,
                      top: isActive ? 0 : -56,
                      bottom: isActive ? 0 : -56,
                      child: Hero(
                        tag: place.id,
                        child: Image.asset(
                          place.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
