class Chatbot{
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final BotCategory category;

  Chatbot({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
  });
}

enum BotCategory{
  general,
  sales,
  support,
  hr,
}