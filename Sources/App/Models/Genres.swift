import Fluent
import Vapor

final class Genres: Model, Content {
  static let schema = "genres"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "title")
  var title: String

  init() { }

  internal init(id: UUID? = nil, title: String) {
    self.id = id
    self.title = title
  }
}
