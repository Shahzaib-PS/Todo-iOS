import Fluent
import Vapor

final class Language: Model, Content {
  static let schema = "languages"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "language")
  var language: String

  init() { }

  internal init(id: UUID? = nil, language: String) {
    self.id = id
    self.language = language
  }
}
