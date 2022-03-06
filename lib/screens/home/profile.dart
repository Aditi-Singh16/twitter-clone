import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Map<String,dynamic> user = {
    'name':'Aditi',
    'username':'@Aditi485679',
    'profile':'https://www.ssrl-uark.com/wp-content/uploads/2014/06/no-profile-image-300x300.png',
    'month_of_join':'September 2019',
    'following':1,
    'followers':0,
    'Tweets':[
      {
        'date':'02 oct 19',
        'media':"https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG5hdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        'description':'hello world this is my first tweet',
        'shares':20,
        'retweet':10,
        'likes':20,
        'thread':1,
      }
    ]
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              decoration: BoxDecoration(
                color:Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back,color: Colors.white,size: 27,),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/search');
                      },
                      icon: Icon(Icons.search,color: Colors.white,size: 27,),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(FontAwesomeIcons.ellipsisV,color: Colors.white,size: 20,)
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.13,
            left: MediaQuery.of(context).size.width*0.05,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(user['profile']),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.24,
              left: MediaQuery.of(context).size.width*0.055,
            child: Text(
              user["name"],
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.28,
            left: MediaQuery.of(context).size.width*0.055,
            child: Text(
              user["username"],
              style: TextStyle(
                  color:Colors.grey,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w100
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.19,
            right: MediaQuery.of(context).size.width*0.05,
            child: Container(
              padding: EdgeInsets.only(top:5.0,bottom: 5.0,left: 10.0,right: 10.0),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  )
              ),
              child: Text(
                'Set up profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.32,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.calendar),
                      SizedBox(width: 6,),
                      Text(
                        'Joined ${user['month_of_join']}',
                        style: TextStyle(
                            color:Colors.grey,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w100
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '${user['following']}',
                        style:  TextStyle(
                            color:Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(width: 3,),
                      Text(
                        'Following',
                        style:TextStyle(
                            color:Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w100
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '${user['followers']}',
                        style:  TextStyle(
                            color:Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(width: 3,),
                      Text(
                        'Followers',
                        style:TextStyle(
                            color:Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w100
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.95,
                    child: Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: user['Tweets'].length,
                      itemBuilder: (context,i){
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(user['profile']),
                                radius: 20,
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:  CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(user['name'],
                                        style:TextStyle(
                                            color:Colors.black,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Text(user['username'].length > 10? user['username'].toString().substring(0,9):user['username'],
                                        style:TextStyle(
                                            color:Colors.grey,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w100
                                        ),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.22),
                                      Text(user['Tweets'][i]['date'],
                                        style:TextStyle(
                                            color:Colors.grey,
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w100
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                      user['Tweets'][i]['description'],
                                      style:TextStyle(
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal,
                                      )
                                  ),
                                  Image(
                                    image: NetworkImage(user['Tweets'][i]['media']),
                                    width: MediaQuery.of(context).size.width*0.8,
                                    height: MediaQuery.of(context).size.height*0.3,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.02,
                                    width: MediaQuery.of(context).size.width*0.8,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        IconButton(onPressed: null, icon: Icon(FontAwesomeIcons.comment , size: 17,)),
                                        IconButton(onPressed: null, icon: Icon(FontAwesomeIcons.retweet, size: 17,)),
                                        IconButton(onPressed: null, icon: Icon(FontAwesomeIcons.heart, size: 17,)),
                                        IconButton(onPressed: null, icon: Icon(FontAwesomeIcons.shareAlt, size: 17,)),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        heroTag: null,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add,color: Colors.white),
      ),
    );
  }
}
