import 'package:test_project/src/core/mixins/base_model.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';

class MenuItemModel extends MenuItemEntity implements BaseModel<MenuItemModel> {
  const MenuItemModel({
    required super.categoryId,
    required super.name,
    required super.image,
    required super.price,
    super.id,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      categoryId: json['category_id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as num,
      id: json['id'] as int,
    );
  }

  factory MenuItemModel.fromEntity(MenuItemEntity entity) {
    return MenuItemModel(
      categoryId: entity.categoryId,
      name: entity.name,
      image: entity.image,
      price: entity.price,
      id: entity.id,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  @override
  MenuItemModel fromJson(Map<String, dynamic> json) {
    return MenuItemModel.fromJson(json);
  }
}

const bentoBoxMenuItems = [
  MenuItemEntity(
    categoryId: 1,
    image: 'https://via.placeholder.com/300x200?text=Classic+Bento+Box',
    name: 'Classic Bento Box',
    price: 23.5,
  ),
  MenuItemEntity(
    categoryId: 1,
    image: 'https://via.placeholder.com/300x200?text=Deluxe+Bento+Box',
    name: 'Deluxe Bento Box',
    price: 28.99,
  ),
  MenuItemEntity(
    categoryId: 1,
    image: 'https://via.placeholder.com/300x200?text=Vegetarian+Bento+Box',
    name: 'Vegetarian Bento Box',
    price: 22.99,
  ),
  MenuItemEntity(
    categoryId: 1,
    image:
        'https://via.placeholder.com/300x200?text=Teriyaki+Chicken+Bento+Box',
    name: 'Teriyaki Chicken Bento Box',
    price: 24.99,
  ),
  MenuItemEntity(
    categoryId: 1,
    image: 'https://via.placeholder.com/300x200?text=Katsu+Bento+Box',
    name: 'Katsu Bento Box',
    price: 25.99,
  ),
];
const buildYourOwnRamenMenuItems = [
  MenuItemEntity(
    categoryId: 2,
    image: 'https://via.placeholder.com/300x200?text=Build+Your+Own+Ramen',
    name: 'Customize Your Ramen',
    price: 12.99,
  ),
];
const cheesecakeSeriesMenuItems = [
  MenuItemEntity(
    categoryId: 3,
    image: 'https://via.placeholder.com/300x200?text=Classic+Cheesecake',
    name: 'Classic Cheesecake',
    price: 6.99,
  ),
  MenuItemEntity(
    categoryId: 3,
    image: 'https://via.placeholder.com/300x200?text=Matcha+Cheesecake',
    name: 'Matcha Cheesecake',
    price: 7.49,
  ),
  MenuItemEntity(
    categoryId: 3,
    image: 'https://via.placeholder.com/300x200?text=Strawberry+Cheesecake',
    name: 'Strawberry Cheesecake',
    price: 7.99,
  ),
  MenuItemEntity(
    categoryId: 3,
    image: 'https://via.placeholder.com/300x200?text=Chocolate+Cheesecake',
    name: 'Chocolate Cheesecake',
    price: 7.99,
  ),
  MenuItemEntity(
    categoryId: 3,
    image: 'https://via.placeholder.com/300x200?text=Mango+Cheesecake',
    name: 'Mango Cheesecake',
    price: 8.49,
  ),
];

const dessertsMenuItems = [
  MenuItemEntity(
    categoryId: 4,
    image: 'https://via.placeholder.com/300x200?text=Mochi+Ice+Cream',
    name: 'Mochi Ice Cream',
    price: 3.99,
  ),
  MenuItemEntity(
    categoryId: 4,
    image: 'https://via.placeholder.com/300x200?text=Green+Tea+Pudding',
    name: 'Green Tea Pudding',
    price: 4.50,
  ),
  MenuItemEntity(
    categoryId: 4,
    image: 'https://via.placeholder.com/300x200?text=Tempura+Ice+Cream',
    name: 'Tempura Ice Cream',
    price: 5.99,
  ),
  MenuItemEntity(
    categoryId: 4,
    image: 'https://via.placeholder.com/300x200?text=Matcha+Shiratama',
    name: 'Matcha Shiratama',
    price: 4.99,
  ),
  MenuItemEntity(
    categoryId: 4,
    image: 'https://via.placeholder.com/300x200?text=Warabi+Mochi',
    name: 'Warabi Mochi',
    price: 5.50,
  ),
];
const drinksMenuItems = [
  MenuItemEntity(
    categoryId: 5,
    image: 'https://via.placeholder.com/300x200?text=Japanese+Green+Tea',
    name: 'Japanese Green Tea',
    price: 2.50,
  ),
  MenuItemEntity(
    categoryId: 5,
    image: 'https://via.placeholder.com/300x200?text=Calpis+Water',
    name: 'Calpis Water',
    price: 2.99,
  ),
  MenuItemEntity(
    categoryId: 5,
    image: 'https://via.placeholder.com/300x200?text=Iced+Coffee',
    name: 'Iced Coffee',
    price: 3.25,
  ),
  MenuItemEntity(
    categoryId: 5,
    image: 'https://via.placeholder.com/300x200?text=Iced+Tea',
    name: 'Iced Tea',
    price: 2.75,
  ),
  MenuItemEntity(
    categoryId: 5,
    image: 'https://via.placeholder.com/300x200?text=Soda',
    name: 'Soda',
    price: 2.25,
  ),
];
const extrasMenuItems = [
  MenuItemEntity(
    categoryId: 6,
    image: 'https://via.placeholder.com/300x200?text=Extra+Nori',
    name: 'Extra Nori',
    price: 0.50,
  ),
  MenuItemEntity(
    categoryId: 6,
    image: 'https://via.placeholder.com/300x200?text=Ajitama+(Soft-Boiled+Egg)',
    name: 'Ajitama (Soft-Boiled Egg)',
    price: 1.25,
  ),
  MenuItemEntity(
    categoryId: 6,
    image: 'https://via.placeholder.com/300x200?text=Extra+Meat',
    name: 'Extra Meat',
    price: 2.00,
  ),
  MenuItemEntity(
    categoryId: 6,
    image: 'https://via.placeholder.com/300x200?text=Extra+Vegetables',
    name: 'Extra Vegetables',
    price: 1.50,
  ),
  MenuItemEntity(
    categoryId: 6,
    image: 'https://via.placeholder.com/300x200?text=Extra+Spices',
    name: 'Extra Spices',
    price: 0.75,
  ),
];

const fruitTeaMenuItems = [
  MenuItemEntity(
    categoryId: 7,
    image: 'https://via.placeholder.com/300x200?text=Strawberry+Fruit+Tea',
    name: 'Strawberry Fruit Tea',
    price: 4.99,
  ),
  MenuItemEntity(
    categoryId: 7,
    image: 'https://via.placeholder.com/300x200?text=Lychee+Fruit+Tea',
    name: 'Lychee Fruit Tea',
    price: 5.25,
  ),
  MenuItemEntity(
    categoryId: 7,
    image: 'https://via.placeholder.com/300x200?text=Mango+Fruit+Tea',
    name: 'Mango Fruit Tea',
    price: 5.50,
  ),
  MenuItemEntity(
    categoryId: 7,
    image: 'https://via.placeholder.com/300x200?text=Passionfruit+Fruit+Tea',
    name: 'Passion Fruit Tea',
    price: 5.75,
  ),
  MenuItemEntity(
    categoryId: 7,
    image: 'https://via.placeholder.com/300x200?text=Honey+Lemon+Tea',
    name: 'Honey Lemon Tea',
    price: 4.25,
  ),
];
const hangInRamenMenuItems = [
  MenuItemEntity(
    categoryId: 8,
    image: 'https://via.placeholder.com/300x200?text=Tonkotsu+Ramen',
    name: 'Classic Tonkotsu Ramen',
    price: 14.99,
  ),
  MenuItemEntity(
    categoryId: 8,
    image: 'https://via.placeholder.com/300x200?text=Shoyu+Ramen',
    name: 'Shoyu Ramen',
    price: 13.50,
  ),
  MenuItemEntity(
    categoryId: 8,
    image: 'https://via.placeholder.com/300x200?text=Spicy+Miso+Ramen',
    name: 'Spicy Miso Ramen',
    price: 15.99,
  ),
  MenuItemEntity(
    categoryId: 8,
    image: 'https://via.placeholder.com/300x200?text=Vegetable+Ramen',
    name: 'Vegetable Ramen',
    price: 12.99,
  ),
  MenuItemEntity(
    categoryId: 8,
    image: 'https://via.placeholder.com/300x200?text=Curry+Ramen',
    name: 'Curry Ramen',
    price: 14.50,
  ),
];
const jamMilkyMenuItems = [
  MenuItemEntity(
    categoryId: 9,
    image: 'https://via.placeholder.com/300x200?text=Strawberry+Jam+Milky',
    name: 'Strawberry Jam Milky',
    price: 4.25,
  ),
  MenuItemEntity(
    categoryId: 9,
    image: 'https://via.placeholder.com/300x200?text=Matcha+Jam+Milky',
    name: 'Matcha Jam Milky',
    price: 4.50,
  ),
  MenuItemEntity(
    categoryId: 9,
    image: 'https://via.placeholder.com/300x200?text=Chocolate+Jam+Milky',
    name: 'Chocolate Jam Milky',
    price: 4.75,
  ),
  MenuItemEntity(
    categoryId: 9,
    image: 'https://via.placeholder.com/300x200?text=Honey+Jam+Milky',
    name: 'Honey Jam Milky',
    price: 4.25,
  ),
  MenuItemEntity(
    categoryId: 9,
    image: 'https://via.placeholder.com/300x200?text=Coffee+Jam+Milky',
    name: 'Coffee Jam Milky',
    price: 4.50,
  ),
];
const japaneseGrilleMenuItems = [
  MenuItemEntity(
    categoryId: 10,
    image: 'https://via.placeholder.com/300x200?text=Yakitori+Chicken',
    name: 'Yakitori Chicken Skewers',
    price: 6.99,
  ),
  MenuItemEntity(
    categoryId: 10,
    image: 'https://via.placeholder.com/300x200?text=Gyoza+(Pot+Stickers)',
    name: 'Gyoza (Pot Stickers)',
    price: 5.50,
  ),
  MenuItemEntity(
    categoryId: 10,
    image: 'https://via.placeholder.com/300x200?text=Edamame',
    name: 'Edamame',
    price: 3.99,
  ),
  MenuItemEntity(
    categoryId: 10,
    image: 'https://via.placeholder.com/300x200?text=Tempura+Vegetables',
    name: 'Tempura Vegetables',
    price: 7.99,
  ),
  MenuItemEntity(
    categoryId: 10,
    image: 'https://via.placeholder.com/300x200?text=Grilled+Salmon',
    name: 'Grilled Salmon',
    price: 12.99,
  ),
];
const kidMenuMenuItems = [
  MenuItemEntity(
    categoryId: 11,
    image: 'https://via.placeholder.com/300x200?text=Kids+Ramen',
    name: 'Kids Ramen',
    price: 7.99,
  ),
  MenuItemEntity(
    categoryId: 11,
    image: 'https://via.placeholder.com/300x200?text=Kids+Chicken+Katsu',
    name: 'Kids Chicken Katsu',
    price: 8.50,
  ),
  MenuItemEntity(
    categoryId: 11,
    image: 'https://via.placeholder.com/300x200?text=Kids+Rice+Bowl',
    name: 'Kids Rice Bowl',
    price: 6.99,
  ),
  MenuItemEntity(
    categoryId: 11,
    image: 'https://via.placeholder.com/300x200?text=Kids+Edamame',
    name: 'Kids Edamame',
    price: 2.99,
  ),
  MenuItemEntity(
    categoryId: 11,
    image: 'https://via.placeholder.com/300x200?text=Kids+Ice+Cream',
    name: 'Kids Ice Cream',
    price: 2.50,
  ),
];
const lemonadeParadiseMenuItems = [
  MenuItemEntity(
    categoryId: 12,
    image: 'https://via.placeholder.com/300x200?text=Classic+Lemonade',
    name: 'Classic Lemonade',
    price: 3.50,
  ),
  MenuItemEntity(
    categoryId: 12,
    image: 'https://via.placeholder.com/300x200?text=Strawberry+Lemonade',
    name: 'Strawberry Lemonade',
    price: 3.75,
  ),
  MenuItemEntity(
    categoryId: 12,
    image: 'https://via.placeholder.com/300x200?text=Raspberry+Lemonade',
    name: 'Raspberry Lemonade',
    price: 3.75,
  ),
  MenuItemEntity(
    categoryId: 12,
    image: 'https://via.placeholder.com/300x200?text=Blueberry+Lemonade',
    name: 'Blueberry Lemonade',
    price: 3.75,
  ),
  MenuItemEntity(
    categoryId: 12,
    image: 'https://via.placeholder.com/300x200?text=Mango+Lemonade',
    name: 'Mango Lemonade',
    price: 4.25,
  ),
];
