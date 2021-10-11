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

  @Field(key: "duration")
  var duration: String

  @Field(key: "cast")
  var cast: [Cast]

  @Field(key: "genres")
  var genres: [Genres]

  @Field(key: "language")
  var language: [Language]

  @Field(key: "country")
  var country: [Country]

  @Field(key: "rating")
  var rating: Int

  @Field(key: "episodeNumber")
  var episodeNumber: Int

  @Field(key: "comments")
  var comments: [Comment]

  init() { }

  internal init(id: UUID? = nil, title: String, description: String, duration: String, cast: [Cast], genres: [Genres], language: [Language], country: [Country], rating: Int, episodeNumber: Int, comments: [Comment]) {
    self.id = id
    self.title = title
    self.description = description
    self.duration = duration
    self.cast = cast
    self.genres = genres
    self.language = language
    self.country = country
    self.rating = rating
    self.episodeNumber = episodeNumber
    self.comments = comments
  }
}




