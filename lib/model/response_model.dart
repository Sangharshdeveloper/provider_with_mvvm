class ResponseModel {
  int? userId;
  String? title;
  String? body;
  int? id;

  ResponseModel({this.userId, this.title, this.body, this.id});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['id'] = id;
    data['body'] = body;
    data['title'] = title;

    return data;
  }

  // bool? success;
  // Data? data;

  // ResponseModel({this.success, this.data});

  // ResponseModel.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  // }
}

class Data {
  String? id;

  String? courseId;

  int? iv;

  Data({this.id, this.courseId, this.iv});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    courseId = json['courseId'];
    iv = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['_id'] = this.id;
    data['courseId'] = this.courseId;
    data['__v'] = this.iv;

    return data;
  }
}
