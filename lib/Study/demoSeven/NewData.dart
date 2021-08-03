

class NewData{

  late String appTitle;
  late String pubTime;
  late String content;

  NewData(this.appTitle, this.pubTime, this.content);

  NewData.name(this.appTitle, this.pubTime, this.content);

  NewData.fromJson(Map<String, dynamic> parsedJson)
      : appTitle = parsedJson["appTitle"],
        pubTime = parsedJson["pubTime"],
        content = parsedJson["content"];

  Map<String, dynamic> toJson() {
    return {
      "appTitle": appTitle,
      "pubTime": pubTime,
      "content": content
    };
  }

  @override
  String toString() {
    return 'NewData{appTitle: $appTitle, pubTime: $pubTime, content: $content}';
  }
}