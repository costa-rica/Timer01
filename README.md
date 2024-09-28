# Timer01

![appleAndDD.png](https://nick-rodriguez.info/media/appleAndDD.png)

Swift Xcode sending api calls repeatedly. Print response to termial, until time up or user presses stop button. 

This is a Swift application built programmatically using Storyboard. The app features a `UITabBarController` with two tabs: `Home` and `SendRequest`. The `SendRequest` screen allows users to start and stop API requests at specified intervals.

## Features

- **TabController:** A `UITabBarController` manages the app's navigation with two tabs:
  - **HomeVC:** A placeholder for future content.
  - **SendRequestVC:** The main screen for managing API requests.

- **SendRequestVC:** Contains two buttons:
  1. **Send Request to Hades:** Initiates an API request every 2 seconds and stops automatically after 12 seconds.
  2. **Stop Request to Hades:** Allows the user to stop the API requests early if desired.

- **API Response Handling:** The app prints API responses to the terminal each time a request is made.

- repeated calls continue even if user switches between screens.



