class Spaces{
  final String title;
  final int listening;
  final String host;
  final String bio;
  final int color;
  final int colordown;
  final String profilePic;

  Spaces({
    required this.title,
    required this.bio,
    required this.color,
    required this.colordown,
    required this.host,
    required this.listening,
    required this.profilePic
  });

  Map<String,dynamic> toMap() {
    return {
      "title": title,
      "listening": listening,
      "host": host,
      "bio": bio,
      "color":color,
      "colordown":colordown,
      "profilePic":profilePic
    };
  }

}