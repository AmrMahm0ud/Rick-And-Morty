import 'package:rick/data/sources/local/character/model/local_location_model.dart';

class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  LocalLocationModel toLocalLocationModel() {
    return LocalLocationModel(name: name, url: url);
  }
}
