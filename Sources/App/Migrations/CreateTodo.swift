import Fluent

struct CreateTodo: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    return database.schema("notes")
      .id()
      .field("title", .string, .required)
      .field("subTitle", .string, .required)
      .field("text", .string, .required)
      .field("date", .string, .required)
      .field("completed", .string, .required)
      .field("urgent", .string, .required)
      .create()
  }

  func revert(on database: Database) -> EventLoopFuture<Void> {
    return database.schema("notesTest").delete()
  }
}
