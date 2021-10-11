import Fluent
import Vapor

final class Cast: Model, Content {
  static let schema = "cast"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "name")
  var name: String

  init() { }

  internal init(id: UUID? = nil, name: String) {
    self.id = id
    self.name = name
  }
}
