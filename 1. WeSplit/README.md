# WeSplit

This app was fairly straighforward and no drastic changes were made except for aesthetic implementations.

## Dark Mode

To render Dark Mode, Go to the Info.plist -> Add User Interface Style: Dark

## Navigation Bar Colour

Change the foregroundColor to required Colour.

```swift
init() {
      let navBarAppearance = UINavigationBar.appearance()
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
```



