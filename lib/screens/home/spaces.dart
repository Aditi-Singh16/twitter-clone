import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/firestore_data/firestoreservice.dart';
import 'package:twitter_clone/models/spaces.dart';

class TwitterSpaces extends StatefulWidget {
  const TwitterSpaces({Key? key}) : super(key: key);

  @override
  _TwitterSpacesState createState() => _TwitterSpacesState();
}

class _TwitterSpacesState extends State<TwitterSpaces> {

  FirestoreData _firestoreData = FirestoreData();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Happening Now',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  ),
              ),
              Text('Spaces going on right now',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [Icon(FontAwesomeIcons.fire,color: Colors.pink,), Text('Trending',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
                )],
              ),
              FutureBuilder<List<Spaces>>(
                future: _firestoreData.getSpaces(),
                  builder: (context,snapshot){
                  if(snapshot.hasError){
                    print(snapshot.error);
                    return Text('error');
                  }
                  else if(snapshot.hasData){
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return Container(
                            margin: EdgeInsets.only(bottom:10,top:10),
                            padding: EdgeInsets.all(15.0),
                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height*0.35,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [Color(snapshot.data![index].color), Color(snapshot.data![index].colordown)]
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Live',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(FontAwesomeIcons.ellipsisV,size: 17,color: Colors.white,)
                                    ],
                                  ),
                                  Text(
                                    snapshot.data![index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '${snapshot.data![index].listening.toString()} listening',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage:NetworkImage(snapshot.data![index].profilePic),
                                              radius: 11,
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              snapshot.data![index].host,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Container(
                                              padding:EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color:Colors.grey.withOpacity(0.4),
                                                  borderRadius: BorderRadius.all(Radius.circular(25))),
                                              child: Text(
                                                'Host',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                        Text(
                                          snapshot.data![index].bio,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ]
                            )
                        );
                      },
                    );
                  }
                  return Text("loading");
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
