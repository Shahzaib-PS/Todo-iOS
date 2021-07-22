import Fluent
import Vapor

final class Country: Model, Content {
  static let schema = "countries"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "countryName")
  var countryName: String

  init() { }

  internal init(id: UUID? = nil, countryName: String) {
    self.id = id
    self.countryName = countryName
  }
}
