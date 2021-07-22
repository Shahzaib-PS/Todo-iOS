import Fluent
import Vapor

struct MovieController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let todos = routes.grouped("api", "movies")
    todos.get(use: index)
    todos.post(use: create)
    todos.group(":movieID") { todo in
      todo.patch(use: update)
    }
    todos.group(":movieID") { todo in
      todo.delete(use: delete)
    }
  }

  func index(req: Request) throws -> EventLoopFuture<[Movie]> {
    return Movie.query(on: req.db).all()
  }

  func create(req: Request) throws -> EventLoopFuture<Movie> {
    let movie = try req.content.decode(Movie.self)
    return movie.save(on: req.db).map { movie }
  }

  func update(req: Request) throws -> EventLoopFuture<Movie> {
    let movie = try req.content.decode(Movie.self)
    return movie.update(on: req.db).map { movie }
  }

  func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
    return Movie.find(req.parameters.get("movieID"), on: req.db)
      .unwrap(or: Abort(.notFound))
      .flatMap { $0.delete(on: req.db) }
      .transform(to: .ok)
  }
}
