import Fluent

struct CreateMovie: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    return database.schema("movies")
      .id()
      .field("title", .string, .required)
      .field("description", .string, .required)
      .field("cast", .string, .required)
      .field("genres", .array, .required)
      .field("language", .array, .required)
      .field("country", .array, .required)
      .create()
  }

  func revert(on database: Database) -> EventLoopFuture<Void> {
    return database.schema("moviesTest").delete()
  }
}
