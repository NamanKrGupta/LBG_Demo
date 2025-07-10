# LBG_Demo

A simple SwiftUI application demonstrating the MVVM architecture pattern with asynchronous movie data fetching and unit testing.

## Features

- Fetches movie data from a remote API  
- Displays a list of movies with poster images, titles, years, and runtimes  
- Shows detailed information on a separate screen when a movie is selected  
- Handles loading and error states gracefully  
- Includes comprehensive unit tests for ViewModels and SwiftUI Views  

## Requirements

- Xcode 14 or later  
- iOS 15 or later  

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/LBG_Demo.git
   cd LBG_Demo
Open the project in Xcode:

bash
Copy
Edit
open LBG_Demo.xcodeproj
Add the ViewInspector package for SwiftUI unit testing:

In Xcode, go to File > Add Packages…

Enter URL: https://github.com/nalexn/ViewInspector.git

Select the latest version and add to your test target

Build and run the app.

Usage
The app loads movies from the fake movies API and displays them in a list view. Tap on any movie to view its details including the poster, title, and release year.

Testing
Unit tests cover:

MoviesListViewModel — data loading, loading state, and error handling

MovieDetailViewModel — movie data initialization

SwiftUI Views — using ViewInspector to verify UI elements and state

Run tests by pressing Cmd + U in Xcode or by running:

bash
Copy
Edit
xcodebuild test -scheme LBG_Demo
Project Structure
Models — Data models like Movie

Services — Networking protocols and implementations (NetworkService, MockMovieService)

ViewModels — Business logic for list and detail views

Views — SwiftUI views such as MoviesListView, MovieDetailView, and MovieRowView

Tests — Unit tests for ViewModels and Views

API Endpoint
Movies data is fetched from:
https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies

License
This project is licensed under the MIT License.

Created by Naman Gupta
Contact: namang228@gmail.com

bash
Copy
Edit

If you want, I can help you generate a GitHub Actions workflow for automated testing or anything else!