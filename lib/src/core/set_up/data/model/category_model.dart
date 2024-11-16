import 'dart:convert';

import 'package:test_project/src/core/mixins/base_model.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity implements BaseModel<CategoryModel> {
  const CategoryModel({
    required super.name,
    required super.items,
    required super.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      items: (jsonDecode(json['items'] as String) as List)
          .map((e) => int.parse(e.toString())).toList(),
      name: json['name'] as String,
      id: json['id'] as int,
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      items: entity.items,
      name: entity.name,
      id: entity.id,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'items': jsonEncode(items),
      'name': name,
    };
  }

  @override
  CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel.fromJson(
        json,
      );
}
