class Item {
  final String nameProduct;
  final String category;

  Item({
    required this.nameProduct,
    required this.category,
  });


      factory Item.fromJson(Map<String, dynamic> json) => Item(
        nameProduct: json["nombreProducto"],
        category: json["categoria"],
        
    );

    Map<String, dynamic> toJson() => {
        "nombreProducto": nameProduct,
        "categoria": category,
       
    };
}
