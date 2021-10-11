import Fluent
import Vapor

final class Comment: Model, Content {
  static let schema = "comments"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "description")
  var description: String

  init() { }

  internal init(id: UUID? = nil, description: String) {
    self.id = id
    self.description = description
  }
}
