List<Note> noteListFromJson(List parsedList) {
  //parsedList.removeWhere((value) => value == null);

  List<Note> newlist = [];

  for (var i = 0; i < parsedList.length; i++) {
    if (parsedList[i] != null) {
      newlist.add(Note.fromJson(parsedList[i]));
    }
  }

  return newlist;

  //return parsedList.map((e) => Note.fromJson(e)).toList();
}

class Note {
  int? id;
  String? content;

  Note({this.id, this.content});

  factory Note.fromJson(Map<dynamic, dynamic> json) =>
      Note(content: json["content"], id: json["id"]);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id,
        'content': content,
      };
}
