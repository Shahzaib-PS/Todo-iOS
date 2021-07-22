import Fluent
import Vapor

func routes(_ route: Application) throws {
  route.on(.GET, "ping") { req -> String in
      return "123"
  }

  let todoController = TodoController()
  try route.register(collection: todoController)
}
