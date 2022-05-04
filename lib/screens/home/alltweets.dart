import 'package:flutter/material.dart';
import 'package:tweet_ui/compact_tweet_view.dart';
import 'package:tweet_ui/embedded_tweet_view.dart';
import 'package:tweet_ui/models/api/v1/tweet.dart';
import 'package:twitter_clone/screens/home/getTweets.dart';

class AllTweets extends StatefulWidget {
  const AllTweets({Key? key}) : super(key: key);

  @override
  State<AllTweets> createState() => _AllTweetsState();
}

class _AllTweetsState extends State<AllTweets> {
  GetMyTweets myTweets = new GetMyTweets();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: myTweets.mytweets.length,
          itemBuilder: (context, index) {
            return EmbeddedTweetView.fromTweetV1(
              TweetV1Response.fromJson(myTweets.mytweets[index]));
          }
      )
    );
  }
}
