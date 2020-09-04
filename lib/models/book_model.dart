class Book {
  final int code;
  final String name;
  final String author;
  final int price;
  final bool borrow;
  final int availableCount;
  final String description;

  Book(
      {
        this.code,
        this.name,
        this.price,
        this.author,
        this.borrow,
        this.availableCount,
        this.description,
      }
      );

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      code: json['code'],
      name: json['name'],
      price: json['price'],
      author: json['author'],
      borrow: json['borrow'],
      availableCount: json['available_count'],
      description: json['description'],
    );
  }
}