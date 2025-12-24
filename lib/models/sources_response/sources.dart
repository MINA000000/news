class Sources {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;
  bool isSelected;
  Sources.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      url = json['url'],
      category = json['category'],
      language = json['language'],
      country = json['country'],
      isSelected = false;
}
