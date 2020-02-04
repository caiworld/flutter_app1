import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'company.g.dart';

@JsonSerializable()
class Company {
    Company();

    String name;
    List<User> users;
    
    factory Company.fromJson(Map<String,dynamic> json) => _$CompanyFromJson(json);
    Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
