import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:textfield_tags/textfield_tags.dart';

class SpacesForm extends StatefulWidget {
  const SpacesForm({Key? key}) : super(key: key);

  @override
  _SpacesFormState createState() => _SpacesFormState();
}

class _SpacesFormState extends State<SpacesForm> {

  final _formKey = GlobalKey<FormState>();
  bool startAdd = false;
  bool isSwitched = false;
  TextEditingController _controller = new TextEditingController();

  List<String> topics = [];

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.5,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create your space',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,

                  ),
                ),
                Icon(
                  FontAwesomeIcons.questionCircle,
                  color: Colors.blue
                )
              ],
            ),
            SizedBox(height: 10,),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name your Space',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintMaxLines: 2,
                      hintText: 'What would you like to talk about?',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                      )
                    ),
                  ),
                  // SizedBox(height: ,),
                  startAdd?
                  TextFieldTags(
                      tagsStyler: TagsStyler(
                          tagTextStyle: TextStyle(fontWeight: FontWeight.normal),
                          tagDecoration: BoxDecoration(color: Colors.blue[300], borderRadius: BorderRadius.circular(15.0), ),
                          tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.blue[900]),
                      ),
                      textFieldStyler: TextFieldStyler(
                        hintText: 'Add topics',
                        helperText: ''
                      ),
                      onTag: (tag) {
                        topics.add(tag);
                      },
                      onDelete: (tag) {
                        if(topics.length == 1){
                          setState(() {
                            startAdd = false;
                          });
                        }
                        topics.remove(tag);
                      },
                      validator: (tag){
                        if(tag.length>15){
                          return "hey that's too long";
                        }
                        return null;
                      }
                  ):
                  TextButton(onPressed: (){
                    setState(() {
                      startAdd = true;
                    });
                  },
                      child: Text(
                        '+ Add Topics',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17
                        ),
                      )
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Record Space',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800

                        ),
                      ),
                      Switch(
                            onChanged: toggleSwitch,
                            value: isSwitched,
                            activeColor: Colors.blue,

                          )

                    ],
                  ),
                  SizedBox(height: startAdd?11:15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.65,
                        height: 48.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            gradient: LinearGradient(
                                colors: [Color(0xffFF0B3FC1),Colors.deepPurpleAccent,  Colors.deepPurpleAccent[100]!]
                            )
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if(_controller.text.isEmpty){
                              print('text empty');
                              Flushbar(
                                message: 'Please add name of your Space',
                              )..show(context);
                            }else if(topics.isEmpty){
                              Flushbar(
                                message: 'Please Add at most 3 topics',
                              )..show(context);
                            }
                            else{
                              Flushbar(
                                message: 'Processing Data',
                              )..show(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.transparent,shadowColor: Colors.transparent),
                          child: Text(
                            'Start your Space',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: Colors.grey[300]
                        ),
                        child: Icon(
                            FontAwesomeIcons.calendarAlt,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

