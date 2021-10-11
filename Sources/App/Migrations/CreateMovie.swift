import Fluent

struct CreateMovie: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    return database.schema("movies")
      .id()
      .field("title", .string, .required)
      .field("description", .string, .required)
      .field("duration", .string, .required)
      .field("cast", .array(of: .custom(Cast.self)), .required)
      .field("genres", .array(of: .custom(Genres.self)), .required)
      .field("language", .array(of: .custom(Language.self)), .required)
      .field("country", .array(of: .custom(Country.self)), .required)
      .field("rating", .string, .required)
      .field("episodeNumber", .string, .required)
      .field("comments", .array(of: .custom(Comment.self)), .required)
      .create()
  }

  func revert(on database: Database) -> EventLoopFuture<Void> {
    return database.schema("moviesTest").delete()
  }
}
