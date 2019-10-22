class NarutoModel {
  String imageUrl;
  String title;
  String sinopsis;

  NarutoModel({
    this.imageUrl,
    this.title,
    this.sinopsis,
  });

  factory NarutoModel.fromJson(Map<String, dynamic> json) {
    return NarutoModel (
      imageUrl: json["image_url"],
      title: json["title"],
      sinopsis: json["synopsis"]
    );
  }

}

