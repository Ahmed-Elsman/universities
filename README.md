# Universities App

## Overview

This project is a modular mobile application developed in Swift and UIKit, following the VIPER architecture. The application consists of two main modules:

- **Module A**: Listing Screen - Displays a list of universities fetched from an API.
- **Module B**: Details Screen - Shows detailed information about a selected university.

The app fetches data from an API, caches it in a local database using Realm, and displays it in a user-friendly interface. If the API call fails, the app fetches data from the local database. 

The VIPER architecture promotes code organization and separation of concerns, ensuring a clean and maintainable codebase.

## Features

- **Modular Architecture**: The app is divided into distinct modules for the listing and details screens.
- **VIPER Architecture**: Utilizes VIPER architecture for better separation of concerns and maintainability.
- **Networking**: Fetches data from a remote API.
- **Local Data Caching**: Caches fetched data using Realm for offline access.
- **Error Handling**: Displays appropriate error messages when network requests fail.
- **Domain-Driven Design (DDD)**: Incorporates DDD principles to structure the application's core logic and infrastructure effectively.

### Architecture
 ## VIPER Architecture

The VIPER architecture is used to organize the app's structure. VIPER stands for:

- **View**: The View is responsible for displaying data to the user and handling user interactions.
- **Interactor**: The Interactor contains the business logic of the app. It fetches data from the network or local database.
- **Presenter**: The Presenter acts as a mediator between the View and the Interactor. It receives user input from the View and requests data from the Interactor.
- **Entity**: The Entity represents the data models used in the app.
- **Router**: The Router handles navigation and routing between screens.

## Package Declarations

### ListingScreen (Module A)
ListingScreen is a package that contains the Listing Screen and has dependencies on the DAL package.

### DetailsScreen (Module B)
DetailsScreen is a package that contains the Details Screen and has dependencies on the Common package.

### Common
The Common package contains shared files and has dependencies on RealmSwift.

### DAL (Data Access Layer)
The DAL package contains data access layer files and has dependencies on the Common package and RealmSwift.

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/Ahmed-Elsman/universities.git
    cd universities
    ```

2. **Install dependencies**:
    - Ensure you have two main packages ListingScreen, DetailsScreen.
    - If you face any problem just right-click on Package Dependencies and click on Resolve Package Versions

3. **Open the project**:
    - Open `Universities.xcodeproj` in Xcode.

4. **Build and Run**:
    - Select the target device and run the application.

## Demo
<img src="./demo/demo.gif"  width="25%" height="25%">

## Usage

### Listing Screen (Module A)
- The user lands on the Listing screen which fetches data from the API and caches it in the local database. If the API call fails, data is fetched from the local database if available, otherwise, an error alert is displayed.

### Details Screen (Module B)
- The user can tap on an item in the listing screen to navigate to the details screen. The details screen shows detailed information about the selected university.

### Refresh Functionality
- A refresh button is provided to refresh the listing screen. The details screen can be back to the listing screen, which triggers a refresh and refetches data from the API.

## API and Domain-Driven Design (DDD)

- The app fetches data from the following API:
    ```
    http://universities.hipolabs.com/search?country=United%20Arab%20Emirates
    ```

### Domain-Driven Design (DDD)

We have implemented Domain-Driven Design (DDD) principles to structure our application effectively. The key aspects of our DDD implementation are as follows:

1. **Domain Layer**: This layer contains the business logic and domain models, such as the `University` entity. It encapsulates the core functionality of the application.

2. **Application Layer**: This layer coordinates the application's behavior by interacting with the domain layer. It includes use cases such as fetching universities and handles the flow of data between the user interface and the domain layer.

3. **Infrastructure Layer**: This layer handles the technical implementation details, such as network requests and database operations. It includes the `UniversityRepository` implementation and manages the interaction with Realm for local data persistence.
    
## Localization

The project is open for localization with adding multiple languages using String Catalogs, we are now supporting:

- English

we can add more languages from here just click on the plus icon (+) and select the language, also this catalog should be refactored by adding localization for each package related to it's usage.

<img src="./images/localization.jpg"  width="50%" height="25%">

## Acknowledgments

- This project uses [Realm](https://realm.io/) for the local database.
- The network requests are handled using [URLSession](https://developer.apple.com/documentation/foundation/urlsession).

## Future Enhancements

- **Snapshot Testing**: Add snapshot testing to verify the UI across different states.
- **Unit Tests**: Cover critical parts of the application with unit tests, especially network request handling and data retrieval.
- **Navigation Refactoring**: Refactor the navigation logic for better reusability across the app.
  
## Info

Name: Ahmed Elsman

Email: ahmedelsman0@gmail.com

Thanks Hope to hear from you soon.


