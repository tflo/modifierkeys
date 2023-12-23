import Cocoa

let currFlags = NSEvent.modifierFlags
var currModifiers: [String] = []

if currFlags.contains(.capsLock) {
	currModifiers.append("capslock")
}
if currFlags.contains(.function) {
	currModifiers.append("function")
}
if currFlags.contains(.control) {
	currModifiers.append("control")
}
if currFlags.contains(.option) {
	currModifiers.append("option")
}
if currFlags.contains(.shift) {
	currModifiers.append("shift")
}
if currFlags.contains(.command) {
	currModifiers.append("command")
}

let niceStr = currModifiers.joined(separator: "-")
print(niceStr, terminator: "")

/* Notes:
Output with all modifiers down: capslock-function-control-option-shift-command
*/
