

import 'package:hive/hive.dart';
part 'user_model.g.dart';
@HiveType(typeId: 0)
class UserModel {
  @HiveType(typeId: 0)
  final String image;
  @HiveType(typeId: 1)
final String name;

UserModel( {required this.name,required this.image});
}