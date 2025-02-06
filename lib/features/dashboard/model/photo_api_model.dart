class PhotoApiModel {
  int? iId;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotoApiModel({this.iId, this.title, this.url, this.thumbnailUrl});

  PhotoApiModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = iId;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
