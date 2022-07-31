class Episode {
  final String name;
  final String url;
  Episode({
    required this.name,
    required this.url,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      name: json['name'],
      url: json['url'],
    );
  }
}
