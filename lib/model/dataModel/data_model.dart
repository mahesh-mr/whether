import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String secondName;
  @HiveField(2)
  String email;

  DataModel({
    required this.email,
    required this.firstName,
    required this.secondName,
  });
}

const String boxName = "datamodel";
