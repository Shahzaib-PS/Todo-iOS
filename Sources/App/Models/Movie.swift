import Fluent
import Vapor

final class Movie: Model, Content {
  static let schema = "movies"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "title")
  var title: String

  @Field(key: "description")
  var description: String

  @Field(key: "cast")
  var cast: String

  @Field(key: "genres")
  var genres: [Genres]

  @Field(key: "language")
  var language: [Language]

  @Field(key: "country")
  var country: [Country]

  init() { }

  internal init(id: UUID? = nil, title: String, description: String, cast: String, genres: [Genres], language: [Language], country: [Country]) {
    self.id = id
    self.title = title
    self.description = description
    self.cast = cast
    self.genres = genres
    self.language = language
    self.country = country
  }
}




