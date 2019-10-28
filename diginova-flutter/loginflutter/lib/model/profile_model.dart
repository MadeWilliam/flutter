class ProfileModel{
  int id;
  ProfileModel({this.id});

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(id: json["id"]);
  }
}