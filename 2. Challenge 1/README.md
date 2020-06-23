# Challenge 1

For this challenge, I created an app which performs:

- Temperature conversion: Celsius, Fahrenheit, or Kelvin.
- Length conversion: meters, kilometers, feet, yards, or miles.
- Time conversion: seconds, minutes, hours, or days.
- Volume conversion: milliliters, liters, cups, pints, or gallons.

## TabView

I created 1 View for each conversion and accessed them with TabView in Content View

```swift
TabView{
            TempView()
            .tabItem {
                Image(systemName: "thermometer")
                Text("Temperature")
            }
            LengthView()
            .tabItem {
                Image(systemName: "rectangle.compress.vertical")
                Text("Length")
              
   					// And so on for the remaining 2 Views
        }
```

### SF Symbols

For the TabView Image, I used SF Symbols. Due to SwiftUI's limitations, I was unable to use the SF Symbols for the NavigationBarTitle and instead had to rely on emojis.

```swift
.navigationBarTitle(Text("⏱ Time"))
```

## View Interface

For a nice rounded-rectangle input Section interfaces, I used a List rather than a form and added in the following modifiers.

```swift
List{
  		Section{
      		// Insert Code Here  
      }
  		Section{
      		// Insert Code Here  
      }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .padding(.top,50)
```

## Switch-Case

Each View is mostly the same except for the different Mathematical calculations. In TempView, I used an if-else statement to do the calculations but then realised it would be much cleaner to use the switch-case statements for the remaining 3.

```swift
// Converts input to smallest unit (seconds)
switch selectedUnitsIn {
        case 1:
            inSecondsTime = inputTime * 60
        case 2:
            inSecondsTime = inputTime * (60 * 60)
        case 3:
            inSecondsTime = inputTime * (60 * 60 * 24)
        case 4:
            inSecondsTime = inputTime * (60 * 60 * 24 * 365)
        default:
            inSecondsTime = inputTime
        }

// Converts to desired output units      
switch selectedUnitsOut {
        case 1:
            finalTime = inSecondsTime / 60
        case 2:
            finalTime = inSecondsTime / (60 * 60)
        case 3:
            finalTime = inSecondsTime / (60 * 60 * 24)
        case 4:
            finalTime = inSecondsTime / (60 * 60 * 24 * 365)
        default:
            finalTime = inSecondsTime
        }
        
        return finalTime
    }
```

## Removing Zeros from Doubles

I added in an extension in order to remove unnecessary 0s from Doubles (ie. 5.070 -> 5.07)

```swift
extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
```

