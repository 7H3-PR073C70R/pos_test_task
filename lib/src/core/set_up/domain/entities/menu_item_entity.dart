import 'package:equatable/equatable.dart';

class MenuItemEntity extends Equatable {
  const MenuItemEntity({
    required this.categoryId,
    required this.name,
    required this.image,
    required this.price,
    this.id,
  });
  final int categoryId;
  final int? id;
  final String name;
  final String image;
  final num price;

  @override
  List<Object?> get props => [
        categoryId,
        name,
        image,
        price,
      ];
}
