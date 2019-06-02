import 'package:uuid/uuid.dart';

class CartItem {
  String id;
  String name;
  bool completed;
  DateTime createdAt;

  CartItem({
    this.name,
    bool completed,
    String id,
    DateTime createdAt,
  })  : this.id = id ?? Uuid().v4(),
        this.completed = completed ?? false,
        this.createdAt = createdAt ?? DateTime.now();

  CartItem copyWith({String id, String name, bool completed}) => CartItem(
        id: id ?? this.id,
        name: name ?? this.name,
        completed: completed ?? this.completed,
        createdAt: this.createdAt,
      );

  CartItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        completed = json['completed'],
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'completed': completed, 'createdAt': createdAt.toString()};

  @override
  String toString() {
    return "$name: $completed";
  }
}
