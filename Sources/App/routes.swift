import Fluent
import Vapor

func routes(_ route: Application) throws {
  let todoController = TodoController()
  try route.register(collection: todoController)
}
