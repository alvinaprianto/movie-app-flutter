class Movies {
  final String title;
  final double rating;
  final String genre;
  final String year;
  final String duration;
  final String banner;
  final String poster;
  final List<Actor> actors;

  Movies(this.title, this.rating, this.genre, this.year, this.duration,
      this.banner, this.poster, this.actors);
}

class Actor {
  final String name;
  final String img;

  Actor(this.name, this.img);
}
