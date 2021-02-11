class ParseImage {
  int id;
  String url;
  String title;

  ParseImage(this.id, this.title, this.url);

  ParseImage.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
