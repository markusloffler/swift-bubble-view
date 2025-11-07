# BubbleView

A lightweight SwiftUI component for creating speech bubble and tooltip-style views with customizable arrow positions.

## Features

- Pure SwiftUI implementation
- Customizable arrow position (top, bottom, leading, trailing, or none)
- Adjustable arrow size and position along the edge
- Works with any SwiftUI content
- Configurable margins and styling
- Clean, minimal API

## Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
- Swift 5.0+

## Installation

### Swift Package Manager

Add BubbleView to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/swift-bubble-view.git", from: "1.0.0")
]
```

Then add it as a dependency to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: ["BubbleView"]
)
```

Or in Xcode:

1. File > Add Package Dependencies
2. Enter the repository URL
3. Select version requirements

## Usage

### Basic Example

```swift
import SwiftUI
import BubbleView

struct ContentView: View {
    var body: some View {
        BubbleView(arrowEdge: .top) {
            Text("Hello, World!")
                .padding()
        }
        .foregroundStyle(.white)
        .background(.blue)
    }
}
```

### Custom Arrow Position

Control where the arrow appears along the edge using `arrowPosition` (0.0 to 1.0):

```swift
BubbleView(
    arrowEdge: .bottom,
    arrowSize: 15,
    arrowPosition: 0.3  // Arrow at 30% along the edge
) {
    VStack(alignment: .leading, spacing: 8) {
        Text("Tooltip Title")
            .font(.headline)
        Text("Additional information goes here")
            .font(.caption)
    }
    .padding()
}
.foregroundStyle(.white)
.background(.black)
```

### Different Arrow Edges

```swift
// Top arrow
BubbleView(arrowEdge: .top) { content }

// Bottom arrow
BubbleView(arrowEdge: .bottom) { content }

// Leading (left) arrow
BubbleView(arrowEdge: .leading) { content }

// Trailing (right) arrow
BubbleView(arrowEdge: .trailing) { content }

// No arrow (rounded rectangle)
BubbleView(arrowEdge: .none) { content }
```

### Custom Styling

```swift
BubbleView(
    arrowEdge: .top,
    arrowSize: 20,
    arrowPosition: 0.5,
    margin: 16
) {
    Text("Custom styled bubble")
        .padding()
}
.foregroundStyle(.primary)
.background(.yellow.gradient)
.shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
```

## API Reference

### BubbleView

```swift
public struct BubbleView<Content: View>: View {
    public init(
        arrowEdge: BubbleArrowEdge = .none,
        arrowSize: CGFloat = 10,
        arrowPosition: CGFloat = 0.5,
        margin: CGFloat = 10,
        @ViewBuilder content: () -> Content
    )
}
```

**Parameters:**

- `arrowEdge`: Position of the arrow (`.none`, `.top`, `.bottom`, `.leading`, `.trailing`)
- `arrowSize`: Size of the arrow in points (default: 10)
- `arrowPosition`: Relative position along the edge, from 0.0 to 1.0 (default: 0.5)
- `margin`: Internal padding around content (default: 10)
- `content`: The SwiftUI view to display inside the bubble

### BubbleArrowEdge

```swift
public enum BubbleArrowEdge {
    case none
    case top
    case bottom
    case leading
    case trailing
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
