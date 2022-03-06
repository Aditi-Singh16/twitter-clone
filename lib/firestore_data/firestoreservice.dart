import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter_clone/models/spaces.dart';

class FirestoreData{

  Future<List<Spaces>> getSpaces()async{
    List<Spaces> allspaces = [];
      await FirebaseFirestore.instance.collection("allspaces").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Spaces res = Spaces(
            title: result.data()!['title'],
            bio: result.data()!['bio'],
            color: int.parse(result.data()!['color']),
            colordown: int.parse(result.data()!['colordown']),
            host: result.data()!['host'],
            listening: result.data()!['listening'],
            profilePic: result.data()!['profilePic']
        );
        allspaces.add(res);
      });
    });
    print(allspaces);
    return allspaces;
  }
}