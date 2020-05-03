class Quotes {
    final String id;
    final String en;
    final String author;
    final double rating;
    final String quoteId;

    Quotes({
        this.id,
        this.en,
        this.author,
        this.rating,
        this.quoteId,
    });

    factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        id: json["_id"],
        en: json["en"],
        author: json["author"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        quoteId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "en": en,
        "author": author,
        "rating": rating == null ? null : rating,
        "id": quoteId,
    };
}
