// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company()
    ..name = json['name'] as String
    ..users = (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CompanyToJson(Company instance) =>
    <String, dynamic>{'name': instance.name, 'users': instance.users};
