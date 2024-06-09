// ignore: file_names
class LoadData {
  var userId;
  var id;
  var title;

  LoadData(this.userId, this.id, this.title);

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(json['userId'], json['id'], json['title']);
  }
}
