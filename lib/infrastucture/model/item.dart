class Item {
  final String nameProduct;
  final int quantity;
  final String category;

  Item({
    required this.nameProduct,
    required this.quantity,
    required this.category,
  });


      factory Item.fromJson(Map<String, dynamic> json) => Item(
        nameProduct: json["nombreProducto"],
        quantity: json["cantidad"],
        category: json["categoria"],
        
    );

    Map<String, dynamic> toJson() => {
        "nombreProducto": nameProduct,
        "cantidad": quantity,
        "categoria": category,
       
    };
}
