import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.items,
    required this.name,
    required this.id,
  });

  final List<int> items;
  final String name;
  final int id;

  @override
  List<Object?> get props => [items, name, id];
}
