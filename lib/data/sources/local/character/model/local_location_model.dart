import 'package:hive/hive.dart';
import 'package:rick/domain/entity/character/location.dart';

part 'local_location_model.g.dart';

@HiveType(typeId: 2)
class LocalLocationModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? url;

  LocalLocationModel({this.name, this.url});
}

extension LocalLocationModelExtension on LocalLocationModel {
  Location mapToDomain() {
    return Location(
      name: name ?? "",
      url: url ?? "",
    );
  }
}

