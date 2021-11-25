import Fluent
import Vapor

@available(macOS 12.0.0, *)
struct MovieController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    let movie = routes.grouped("api", "movies")
    movie.get(use: index)
    movie.post(use: create)
    movie.group(":movieID") { todo in
      todo.patch(use: update)
    }
    movie.group(":movieID") { todo in
      todo.delete(use: delete)
    }

    movie.get("fetchAllMoviesWithJustTitles", use: fetchMovieTitles)
    movie.get("filterByTitle", use: filterByTitle)
    movie.get("search", use: search)
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

  // Returning the all titles of the movies.
  // http://localhost:8080/api/movies/fetchAllMoviesWithJustTitles
  func fetchMovieTitles(req: Request) async throws -> [FieldProperty<Movie, String>.Value] {
    return try await Movie.query(on: req.db).all(\.$title)
  }

  // Filter by title
  // http://localhost:8080/api/movies/filterByTitle
  func filterByTitle(req: Request) throws -> EventLoopFuture<[Movie]> {
    return Movie.query(on: req.db)
      .filter(\.$title == "Vapor")
      .sort(\.$title)
      .all()
  }

  // Search movie
  // http://localhost:8080/api/movies/search?term=Vapor
  func search(req: Request) async throws -> [FieldProperty<Movie, String>.Value] {
    guard let searchTerm = req.query[String.self, at: "term"] else {
      throw Abort(.badRequest)
    }
    return try await Movie.query(on: req.db)
      .filter(\.$title == searchTerm).all(\.$title)
  }
}
