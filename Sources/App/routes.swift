import Fluent
import Vapor

func routes(_ route: Application) throws {
  route.on(.GET, "ping") { req -> String in
    return "123"
  }

  try route.register(collection: TodoController())
  if #available(macOS 12.0.0, *) {
    try route.register(collection: MovieController())
  } else {
    // Fallback on earlier versions
  }
}
