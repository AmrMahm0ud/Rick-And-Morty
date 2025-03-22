class Lookup {
  final int id;
  final String value;
  bool isSelected;

  Lookup({required this.id, required this.value, this.isSelected = false});

  Lookup copyWith({int? id, String? value, bool? selected}) {
    return Lookup(
      id: id ?? this.id,
      value: value ?? this.value,
      isSelected: selected ?? this.isSelected,
    );
  }
}
