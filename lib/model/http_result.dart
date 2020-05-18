import 'package:json_annotation/json_annotation.dart';

part 'http_result.g.dart';


@JsonSerializable()
class HttpResult extends Object {

  @JsonKey(name: 'state')
  int state;

  @JsonKey(name: 'message')
  String message;

  HttpResult(this.state, this.message,);

  factory HttpResult.fromJson(Map<String, dynamic> srcJson) =>
      _$HttpResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HttpResultToJson(this);

}