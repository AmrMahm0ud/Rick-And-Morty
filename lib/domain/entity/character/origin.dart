import 'package:rick/data/sources/local/character/model/local_origin_model.dart';

class Origin {
  final String name;
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  LocalOriginModel toLocalOriginModel() {
    return LocalOriginModel(name: name, url: url);
  }
}
