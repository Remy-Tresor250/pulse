
import 'package:pulse/model/user.dart';

class Post {

  final String postId;
  final User user;
  final String description;
  final String picturePath;

  Post(this.postId, this.user, this.description, this.picturePath);

  factory Post.fromJson(Map<String, dynamic> json, String token) {
    return Post(
        json["id"],
        User.fromToken({"token": token}),
        json["postDescription"],
        json["picturePath"]
    );
  }

}