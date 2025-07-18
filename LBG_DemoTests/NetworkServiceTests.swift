import XCTest
import Reachability
@testable import LBG_Demo  // Replace with your app target module

class NetworkServiceTests: XCTestCase {
    var service: NetworkService!

    override func setUp() {
        super.setUp()
        service = NetworkService.shared
    }

    func testNetworkServiceSingleton() {
        let anotherInstance = NetworkService.shared
        XCTAssertTrue(service === anotherInstance, "NetworkService should be a singleton")
    }

    func testFetchMoviesSuccess() async throws {
        let movies = try await service.fetchMovies(EndPoints.fetchMovies)
        XCTAssertFalse(movies.isEmpty, "Movies list should not be empty")
    }
        
}
