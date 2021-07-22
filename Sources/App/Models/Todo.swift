import Fluent
import Vapor

final class Todo: Model, Content {
  static let schema = "notes"
  
  @ID(key: .id)
  var id: UUID?
  
  @Field(key: "title")
  var title: String

  @Field(key: "subTitle")
  var subTitle: String

  @Field(key: "text")
  var text: String

  @Field(key: "date")
  var date: String

  @Field(key: "completed")
  var completed: Bool

  @Field(key: "urgent")
  var urgent: Bool
  
  init() { }
  
  init(id: UUID? = nil, title: String, subTitle: String, text: String, date: String, completed: Bool, urgent: Bool) {
    self.id = id
    self.title = title
    self.text = text
    self.date = date
    self.completed = completed
    self.urgent = urgent
  }
}
