// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  email: json['email'] as String,
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'email': instance.email,
  'displayName': instance.displayName,
  'photoUrl': instance.photoUrl,
};
