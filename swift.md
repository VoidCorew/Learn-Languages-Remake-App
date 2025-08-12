```swift
import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var currentNumber = 0.0
    @State private var previousNumber = 0.0
    @State private var operation: String?

    let buttons: [[String]] = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            // Display
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            
            // Buttons
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.didTap(button: button)
                        }) {
                            Text(button)
                                .frame(width: 70, height: 70)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(35)
                                .font(.title)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func didTap(button: String) {
        switch button {
        case "0"..."9", ".":
            if display == "0" || operation == "=" {
                display = button
                operation = nil
            } else {
                display += button
            }
            currentNumber = Double(display) ?? 0
        case "+", "-", "×", "÷":
            operation = button
            previousNumber = currentNumber
            display = "0"
        case "=":
            if let op = operation {
                switch op {
                case "+": currentNumber = previousNumber + currentNumber
                case "-": currentNumber = previousNumber - currentNumber
                case "×": currentNumber = previousNumber * currentNumber
                case "÷": currentNumber = previousNumber / currentNumber
                default: break
                }
                display = "\(currentNumber)"
                operation = "="
            }
        default:
            break
        }
    }
}

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

```