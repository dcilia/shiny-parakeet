### Steps to Run the App

**Requirements:**

- Xcode 16.0
- iOS 18 SDK
- App supports iOS 17+

---

1. Clone the repository
2. Open `Recipes.xcodeproj`
3. In Xcode, navigate to `File` → `Packages` → `Resolve Package Versions` to ensure Swift packages are loaded.
4. To run on the iOS Simulator, simply build and run the project.
5. To run on the iOS Device:
   1. In the project settings, select the `Recipes` target.
   2. In `Signing & Capabilities`, select the development team to codesign the application. The project is set to automatically manage certificates & provisioning profiles.
   3. Build and run the application.

   Please note that the app has logic that randomizes which endpoint is called to simulate the different JSON responses that could arise in a production environment. 

   SwiftUI Previews should work, there are mock json files in the project.

   Test can be run using the main scheme.

---

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

Given the constraints of the project, I prioritized:

- Creating diagrams and flows to understand how to architect the app and discover the components needed before writing one line of code.
- Ensuring business logic met the requirements of the assignment and was easily testable. The assignment cannot be marked complete if requirements are not met.
- Leveraging protocols to create modular, testable components for both production code and unit testing.
- Using OpenAPI for generating the Swift code to fetch data from the API for several reasons:
  - Reduce boilerplate and programmer error.
  - Allows for integration tests to be written that can check for compile & data errors when the API is updated.
  - Encouraged best practice by Apple, there is a video: [Meet Swift OpenAPI Generator](https://developer.apple.com/videos/play/wwdc2023/10171)
- Prioritized checking the app for errors & bugs to ensure requirements are met.
  - Run on Simulator & iOS Device.
  - Profiled with instruments to check for any potential performance issues.

---

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

4.5 hours were spent on this project:

- 0.5 hours → Selecting an architecture, scoping the business logic, dependencies, and understanding the requirements.
- 0.25 hours → Creating the application "skeleton".
- 0.25 hours → Generating the OpenAPI spec and Swift package.
- 0.50 hours → Implementing the TCA reducers, network reachability.
- 0.50 hours → Implementing `RecipesListView` UI with mocks of the `JSON` in the provided endpoints.
- 0.50 hours → Adding unit tests for business logic reducers.
- 0.25 hours → Adding signposts to see potential performance bottlenecks.
- 0.25 hours → Running instruments and profiling the application.
- 0.5 hours → QA work, ensuring product requirements are met.
- 1.00 hours → Writing documentation.

---

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

I initially started with an MVVM approach but pivoted to TCA for several reasons:

- Time constraints → TCA provided a framework that met the needs of the application:
  - Ability to implement complex state management (if needed).
  - Predictable management of side effects and state.
  - Existing structure for implementing state and views.
  - Strong focus on testing and testability.
  - Integration with SwiftUI.

I chose Kingfisher for image fetching and caching due to time constraints and its alignment with the scope of the assignment.

For communication with the REST API, I decided to use OpenAPI generator for the following reasons:

- Less boilerplate, allowing focus on more critical areas of the app.
- From an architecture perspective, in a real production environment, this approach scales well as the API evolves, providing clean abstractions and type-safe code.

I implemented debouncing for the search functionality to prevent excessive requests and improve performance. Additionally, I leveraged dependency injection with the TCA Reducer, which streamlined the process of creating unit tests and enhanced testability throughout the app.

---

### Weakest Part of the Project: What do you think is the weakest part of your project?

The UI is where I prioritized the least. There could be some areas to refactor, such as breaking down UI into more reusable components. Some `@ViewBuilder` functions could be refactored into smaller, reusable components for cleaner UI code. Additionally, there could be some additional polish around animations, etc.  I also did not spend time on UI layouts for multiple orientations.


---

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?

Yes, external dependencies were used:

- The Composable Architecture (TCA) library
- OpenAPIClient - local Swift package
- Kingfisher - Image library
- Network Reachability library

---

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints.

My goal was to demonstrate familiarity with different architectures while also showcasing the ability to use more advanced concepts where applicable. In a traditional MVVM setup, I would typically handle more concurrency directly within the view model, using constructs such as `Task`, interacting with `MainActor`, and managing `Sendable` conformance in asynchronous workflows.

However, I chose to implement the project using **TCA (The Composable Architecture)** to demonstrate my understanding of more complex patterns. While TCA centralizes concurrency management through its Effect system, this reduces the need to directly interact with Swift concurrency features like async/await or MainActor in the view layer. This trade-off allowed me to focus on a more robust state management approach but limited opportunities to work directly with Swift concurrency APIs.

In a production app I would have added additional logging, analytics and metrics recording to ensure that critical user interactions and system behaviors are tracked.

Just to reiterate in the first section, I created logic to randomize which endpoint would get called when fetching recipes to try and simulate a production environment.  This was helpful in looking for bugs and UI inconsistencies.

Additionally, I encountered inconsistencies between the JSON responses and the assignment instructions. For example, the /recipes endpoint was missing the source_url field, which caused JSON parsing failures. I reached out for clarification, and while the issue is being addressed, I implemented a workaround by making the affected model properties optional. Due to this, I was not able to fully test error handling and alerts using the provided endpoints. Please take this into consideration when reviewing.