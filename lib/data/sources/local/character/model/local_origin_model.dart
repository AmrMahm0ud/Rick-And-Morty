import 'package:hive/hive.dart';
import 'package:rick/domain/entity/character/origin.dart';

part 'local_origin_model.g.dart';

@HiveType(typeId: 1)
class LocalOriginModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? url;

  LocalOriginModel({this.name, this.url});
}

extension LocalOriginModelExtension on LocalOriginModel {
  Origin mapToDomain() {
    return Origin(
      name: name ?? "",
      url: url ?? "",
    );
  }
}
