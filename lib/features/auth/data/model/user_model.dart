class UserModel{
  int? id;
  String? imagePath;
  String? name;
  String? email;
  String? phone;


  UserModel({this.id, this.imagePath, this.name});
  UserModel.fromJson(Map<String, dynamic> userMap){
    id = userMap['id'];
    imagePath = userMap['image_path'];
    name= userMap['name'];
    email= userMap['email'];
    phone= userMap['phone'];
  }
}