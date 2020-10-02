import 'package:flutter/material.dart';
import 'package:flutter_discover_ui_app/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _locations = [
    'All',
    'Tel-Aviv',
    'Jerusalem',
    'Japan',
    'London'
  ];
  int _activeLocation = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        right: false,
        left: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
            0, MediaQuery.of(context).size.width * 0.05, 0),
        child: _mainColumn(context),
      ),
    );
  }

  Widget _mainColumn(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black87,
              size: 35,
            ),
            Container(
              height: 40,
              width: 144,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/logo_discover.png'))),
            ),
            Icon(
              Icons.search,
              color: Colors.black87,
              size: 35,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(_context).size.height * 0.03,
              bottom: MediaQuery.of(_context).size.height * 0.03),
          child: _locationBar(_context),
        ),
        _articlesList(_context),
      ],
    );
  }

  Widget _locationBar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
          color: Color.fromRGBO(69, 69, 69, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((i) {
          bool _isActive = _locations[_activeLocation] == i ? true : false;
          return GestureDetector(
            onTap: () {
              setState(() {
                _activeLocation = _locations.indexOf(i);
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  i,
                  style: TextStyle(
                    fontSize: 15,
                    color: _isActive ? Colors.white : Colors.white54,
                    fontFamily: 'Montserrat',
                  ),
                ),
                _isActive
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 5,
                        width: 30,
                      )
                    : SizedBox.shrink()
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _articlesList(BuildContext _context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: getArticles.length,
        itemBuilder: (ctx, index) {
          // print(getArticles[index].name);
          if (_locations[_activeLocation] == 'All' ||
              getArticles[index].name == _locations[_activeLocation]) {
            return Stack(overflow: Overflow.visible, children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(_context).size.height * 0.05),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: MediaQuery.of(_context).size.height * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(getArticles[index].image),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            spreadRadius: 10,
                            blurRadius: 20,
                            offset: Offset(0, 6))
                      ],
                    ),
                    child: _articleInfoColumn(ctx, index),
                  ),
                ),
              ),
              Positioned(
                child: _socialInfoContainer(_context, index),
                bottom: 20,
                left: MediaQuery.of(_context).size.width * 0.10,
              ),
            ]);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _articleInfoColumn(BuildContext _context, int _index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
          child: _authorInfoRow(_context, _index),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.height * 0.05, 30, 0),
          child: _detailInfoRow(_context, _index),
        )
      ],
    );
  }

  Widget _authorInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://edenik.com/assets/images/profile.png'),
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    getArticles[_index].author,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '3 Hours Ago',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 20,
            ),
            SizedBox(
              height: 5,
            ),
            Icon(
              Icons.bookmark,
              color: Colors.white,
              size: 20,
            ),
          ],
        )
      ],
    );
  }

  Widget _detailInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.play_arrow,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(
                  getArticles[_index].title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: Text(
                  getArticles[_index].location,
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
              _ratingWidget(_context, _index)
            ],
          ),
        )
      ],
    );
  }

  Widget _socialInfoContainer(BuildContext _context, int _index) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.08,
      width: MediaQuery.of(_context).size.width * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                getArticles[_index].likes.toString(),
                style: TextStyle(color: Colors.redAccent),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.mode_comment,
                color: Colors.grey,
              ),
              Text(
                getArticles[_index].comments.toString(),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
              Text(
                getArticles[_index].shares.toString(),
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _ratingWidget(BuildContext _context, int _index) {
    return Row(
        children: List<Widget>.generate(5, (_currentIndex) {
      double _fillAmount = getArticles[_index].rating - _currentIndex;
      Icon _starIcon;
      if (_fillAmount > 1) {
        _starIcon = Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 15,
        );
      } else if (_fillAmount >= 0.5) {
        _starIcon = Icon(
          Icons.star_half,
          color: Colors.amberAccent,
          size: 15,
        );
      } else {
        _starIcon = Icon(
          Icons.star_border,
          color: Colors.amberAccent,
          size: 15,
        );
      }
      return _starIcon;
    }));
  }
}
