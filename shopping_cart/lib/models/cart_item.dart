class CartItem {
  String name;
  bool completed;

  CartItem(this.name, this.completed);

  CartItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        completed = json['checked'];

  Map<String, dynamic> toJson() => {'name': name, 'completed': completed};

  @override
  String toString() {
    return "$name: $completed";
  }
}
