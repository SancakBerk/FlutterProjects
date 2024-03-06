class productClass
{
  int id;
  String title;
  double price;
  String category;
  String description;
  String image;
  Rating rating;

  productClass({required this.id ,required this.title, required this.price,required this.category, required this.description, required this.image,required this.rating });

  factory productClass.fromJson(Map<String,dynamic> Map)
  {
    return productClass(id: Map["id"], title: Map["title"], price: Map["price"].toDouble(), category: Map["category"], description: Map["description"], image: Map["image"], rating: Rating.fromJson(Map['rating']),  );
  }

}
class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}