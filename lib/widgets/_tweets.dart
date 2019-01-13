import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class TweetsPage extends StatefulWidget {
  @override
  _TweetsPage createState() => _TweetsPage();
}

class _TweetsPage extends State<TweetsPage> {
  Dio dio = Dio();
  List tweets = [];

  void getTweets() {
    dio.get("https://salty-plateau-23982.herokuapp.com/").then((response) {
      setState(() {
        tweets = response.data['statuses'];
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    getTweets();
  }

  @override
  Widget build(BuildContext context) {
    var tweetsView = ListView.builder(
      itemCount: tweets.length,
      itemBuilder: (context, index) {
        final double _deviceWidth = MediaQuery.of(context).size.width;
        Map tweet = tweets[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
          width: _deviceWidth,
          decoration: BoxDecoration(
            color: Color.fromRGBO(36,52,71,1.0)    ,
            border: Border(
              bottom: Divider.createBorderSide(context, color: Colors.black87),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(tweet['user']['profile_image_url']),
                backgroundColor: Colors.white,
                radius: 20.0,
              ),
              Expanded(
                child: Container(
                  width: _deviceWidth,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: _deviceWidth,
                        padding: EdgeInsets.symmetric(
                            vertical: 7.5, horizontal: 0.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                          tweet['user']['name'],
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          ' - @'+tweet['user']['screen_name'],
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 12.0,
                          ),
                        ),
                          ],
                        )
                      ),
                      Container(
                        width: _deviceWidth,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.5, horizontal: 0.0),
                        child: Text(
                         tweet['text'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        width: _deviceWidth,
                        height: 40.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 60.0,
                              height: 30.0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 35.0,
                                    height: 30.0,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.5, horizontal: 0.0),
                                    child: IconButton(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.all(0.0),
                                      onPressed: () => null,
                                      icon: Icon(
                                        Icons.comment,
                                        color: Colors.white.withOpacity(0.5),
                                        size: 28.0,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 30.0,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7.5, horizontal: 2.0),
                                    child: Text(
                                      '12',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 60.0,
                              height: 30.0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      width: 35.0,
                                      height: 30.0,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.5, horizontal: 0.0),
                                      child: IconButton(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.all(0.0),
                                        onPressed: () => null,
                                        icon: Icon(
                                          Icons.content_copy,
                                          color: Colors.white.withOpacity(0.5),
                                          size: 28.0,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      )),
                                  Container(
                                    width: 25.0,
                                    height: 30.0,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7.5, horizontal: 2.0),
                                    child: Text(
                                      tweet['favorite_count'].toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 60.0,
                              height: 30.0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      width: 35.0,
                                      height: 30.0,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.5, horizontal: 0.0),
                                      child: IconButton(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.all(0.0),
                                        onPressed: () => null,
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white.withOpacity(0.5),
                                          size: 28.0,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      )),
                                  Container(
                                    width: 25.0,
                                    height: 30.0,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7.5, horizontal: 2.0),
                                    child: Text(
                                      tweet['retweet_count'].toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 60.0,
                              height: 30.0,
                              child: IconButton(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(0.0),
                                onPressed: () => null,
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white.withOpacity(0.5),
                                  size: 28.0,
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    return tweetsView;
  }
}
