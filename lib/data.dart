class Article {
  final String name;
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  final double rating;
  bool isLiked = false;

  Article(this.name, this.title, this.image, this.comments, this.likes,
      this.isLiked, this.location, this.shares, this.author, this.rating);
}

List<Article> _articles = [
  Article(
      'Tel-Aviv',
      'Tel-Aviv Beach',
      'https://images.unsplash.com/photo-1500990702037-7620ccb6a60a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      100,
      32000,
      true,
      'Tel-Aviv Israel',
      50,
      'Eden Nahum',
      5),
  Article(
      'Jerusalem',
      'Western Wall',
      'https://images.unsplash.com/photo-1542743408-218cc173cda0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80',
      100,
      32000,
      true,
      'Jerusalem Israel',
      50,
      'Eden Nahum',
      5),
  Article(
      'Japan',
      'Japan\'s second largest metropolitan area',
      'https://images.wallpaperscraft.com/image/pagoda_architecture_sunlight_131905_1920x1080.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Eden Nahum',
      4),
  Article(
      'London',
      'Big Ben Tower',
      'https://images.unsplash.com/photo-1529655683826-aba9b3e77383?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80',
      300,
      50000,
      true,
      'London',
      1250,
      'Tim Salvatore',
      3.5),
  Article(
      'Japan',
      'Japan\'s second largest metropolitan area',
      'https://images.wallpaperscraft.com/image/street_neon_night_city_139596_1920x1080.jpg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',
      5),
];

List<Article> get getArticles {
  return _articles;
}
