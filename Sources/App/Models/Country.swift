import Fluent
import Vapor

final class Country: Model, Content {
  static let schema = "countries"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "countryName")
  var countryName: String

  @Field(key: "countryFlag")
  var countryFlag: String

  init() { }

  internal init(id: UUID? = nil, countryName: String, countryFlag: String) {
    self.id = id
    self.countryName = countryName
    self.countryFlag = countryFlag
  }
}
