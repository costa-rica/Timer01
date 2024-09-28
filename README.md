# Timer01

![appleAndDD.png](https://nick-rodriguez.info/media/appleAndDD.png)

Swift Xcode sending api calls repeatedly. Print response to termial, until time up or user presses stop button. 

This is a Swift application built programmatically using Storyboard. The app features a `UITabBarController` with two tabs: `Home` and `SendRequest`. The `SendRequest` screen allows users to start and stop API requests at specified intervals.

## Features

- **Tab Bar Navigation:** A `UITabBarController` manages the app's navigation with two tabs:
  - **Home:** A placeholder for future content.
  - **SendRequest:** The main screen for managing API requests.

- **SendRequest Screen:** Contains two buttons:
  1. **Start Button:** Initiates an API request every 2 seconds and stops automatically after 12 seconds.
  2. **Stop Button:** Allows the user to stop the API requests early if desired.

- **API Response Handling:** The app prints API responses to the terminal each time a request is made.

## How It Works

1. **Start Sending Requests:**
   - When the user taps the "Start" button on the `SendRequest` screen, the app begins sending an API request every 2 seconds.
   - The requests will automatically stop after 12 seconds if not stopped manually.

2. **Stop Sending Requests:**
   - The user can tap the "Stop" button at any time to halt the API requests before the 12-second duration elapses.

3. **Response Handling:**
   - Each API response is printed to the terminal for debugging and testing purposes.

## Implementation Details

- **Storyboard:** The UI is set up using Storyboard, but all elements (buttons, timers, etc.) are created and managed programmatically.
- **Main Navigation:** Managed by a `UITabBarController` called `TabController` with two tabs:
  - **Home Tab**
  - **SendRequest Tab**
- **Timers:** The app uses `Timer` to manage the intervals of API requests and to handle stopping conditions.
- **API Requests:** The API requests are simulated and their responses are printed to the terminal.

