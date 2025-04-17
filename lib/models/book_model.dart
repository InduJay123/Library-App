class Book {
  final int id;
  final String bookName;
  final String bookimageUrl;
  final int noOfDays;
  bool completed;

  Book({
    required this.id,
    required this.bookName,
    required this.bookimageUrl,
    required this.noOfDays,
    required this.completed
  });
}

