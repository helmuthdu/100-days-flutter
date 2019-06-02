import 'package:uuid/uuid.dart';

class CartItem {
  String id;
  String name;
  bool completed;

  CartItem({
    this.name,
    bool completed,
    String id,
  })  : this.id = id ?? Uuid().v4(),
        this.completed = completed ?? false;

  CartItem copyWith({String id, String name, bool completed}) => CartItem(
        id: id ?? this.id,
        name: name ?? this.name,
        completed: completed ?? this.completed,
      );

  CartItem.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? Uuid().v4(),
        name = json['name'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'completed': completed};

  @override
  String toString() {
    return "$name: $completed";
  }
}
