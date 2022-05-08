class GenreChoice {
  GenreChoice({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;
}

List<GenreChoice> genreList = [
  GenreChoice(id: 28, name: "Action"),
  GenreChoice(id: 12, name: "Adventure"),
  GenreChoice(id: 16, name: "Animation"),
  GenreChoice(id: 35, name: "Comedy"),
  GenreChoice(id: 80, name: "Crime"),
  GenreChoice(id: 99, name: "Documentary"),
  GenreChoice(id: 18, name: "Drama"),
  GenreChoice(id: 10751, name: "Family"),
  GenreChoice(id: 14, name: "Fantasy"),
  GenreChoice(id: 36, name: "History"),
  GenreChoice(id: 27, name: "Horror"),
  GenreChoice(id: 10402, name: "Music"),
  GenreChoice(id: 9648, name: "Mystery"),
  GenreChoice(id: 10749, name: "Romance"),
  GenreChoice(id: 878, name: "Science Fiction"),
  GenreChoice(id: 10770, name: "TV Movie"),
  GenreChoice(id: 53, name: "Thriller"),
  GenreChoice(id: 10752, name: "War"),
  GenreChoice(id: 37, name: "Western"),
];

List<GenreChoice> genreFilter(List<int> unfilteredGenre) {
  List<GenreChoice> filtered = [];
  unfilteredGenre.forEach((element) {
    List<GenreChoice> filter = genreList
        .where((genre) => genre.id.toString().contains(element.toString()))
        .toList();
    filtered.addAll(filter);
  });
  return filtered;
}
