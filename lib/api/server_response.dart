String unknownError =
    '{"statusCode":"200","message":"FAILED","responseBody":{"reason":"Could not process request"}}';
String connError =
    '{"statusCode":"200","message":"FAILED","responseBody":{"reason":"Check your internet connection"}}';

class ServerResponse {
  bool success;
  dynamic body;
  String failureReason;
  dynamic responseBody;

  ServerResponse({this.success, this.body, this.failureReason});

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(
      success: json['success'],
      body: json['body'],
      failureReason: json['failureReason'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['body'] = this.body;
    data['failureReason'] = this.failureReason;
    return data;
  }
}
