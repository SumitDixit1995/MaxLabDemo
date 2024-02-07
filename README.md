# MaxLabDemo

https://github.com/SumitDixit1995/MaxLabDemo/assets/33477378/0583b509-82b7-4fc9-afb6-55a5de8d1062


# To run an iOS project from GitHub : 

1 . Clone the Repository: First, you need to clone the GitHub repository containing the iOS project onto your local machine. You can do this using Git commands or by using GitHub Desktop or another Git client.

### git clone https://github.com/SumitDixit1995/MaxLabDemo
2. Navigate to the Project Directory: Once the repository is cloned, navigate to the project directory using the command line.

### cd <project_directory>

3. Open the Project in Xcode: Use Xcode, the IDE for iOS development, to open the project.

### MaxLabDemo.xcworkspace

4. Select a Simulator : In Xcode, select a simulator to run the project on.

Build and Run: Finally, build and run the project by clicking the play button in Xcode or by pressing Cmd + R.

# Design/Architecture  : 

### I used MVVM for this project 

1. Separation of Concerns: MVVM promotes a clear separation between the UI (View), the presentation logic (ViewModel), and the data/model layer. This separation makes the codebase easier to understand, maintain, and test.

2. Testability: By separating the presentation logic into ViewModels, which are independent of the UI framework (UIKit or SwiftUI), unit testing becomes easier. You can test ViewModel's business logic and data manipulation without involving the UI.

3. Reusability: ViewModels in MVVM can often be reused across different views. This is because they encapsulate the presentation logic and don't have direct dependencies on UI elements. This can lead to a more modular and reusable codebase.

4. Binding: MVVM is often paired with data binding mechanisms, such as Combine or RxSwift, allowing for a reactive approach to UI updates. This can simplify UI updates based on changes in the underlying data.

5. Maintainability: MVVM can lead to more maintainable code compared to Massive View Controller (MVC) pattern, as it reduces the likelihood of having bloated view controllers that are difficult to understand and maintain.

6. Support for SwiftUI: MVVM aligns well with SwiftUI, Apple's declarative UI framework introduced in iOS 13. SwiftUI naturally supports the separation of concerns advocated by MVVM, making it easier to adopt this architecture when working with SwiftUI.

# Challenges : 
 I have faces some changes regarding iOS 13 compatibility 

 1. ActivityIndicator : I was unable to use "ProgressView" due to ios compatibility so i have created custome ProgressView for ActivityIndicator.

 2. Overlay : I was unable to use "Overlay" due to ios compatibility so i have created custome Overlay for Overlay so that i can add View over overlay.

 3. Image wiht url : I was unable to use "AsyncImage" due to ios compatibility so i have to add one dependancy "URLImage" to fix this issue.

### NOTE: Due to lack of time i was writen some test cases.

 Thanks
 Sumit Dixit
