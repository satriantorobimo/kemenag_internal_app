class CommentFiles {
  String fileName;
  String url;

  CommentFiles(this.fileName, this.url);

  factory CommentFiles.fromJson(dynamic json) {
    return CommentFiles(json['fileName'] as String, json['url'] as String);
  }

  @override
  String toString() {
    return '{ ${this.fileName}, ${this.url} }';
  }
}
