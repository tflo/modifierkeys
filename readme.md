# modifierkeys

A command line tool for macOS.

This is a modern version of the Carbon [keys.m](https://brettterpstra.com/2012/08/05/quick-tip-checking-for-modifier-keys-in-shell-scripts/) and possibly other similar programs.

The program returns the state of the following modifier keys on macOS:  
- Caps Lock (⇪)
- Function (fn)
- Control (⌃)
- Option (⌥)
- Shift (⇧)
- Command (⌘)

With all modifier keys down, it will return the string: `capslock-function-control-option-shift-command`.
The order will remain the same, no matter which keys are down. For example, with only Control and Command down, the output is: `control-command`.

The order `control-option-shift-command` corresponds to the traditional order as used by Apple.[^1]

## Usage example in a shell script, with sample output

```shell
#!/usr/bin/env zsh

# To give you time to hold down keys after launching the program
sleep 2

state=$(modifierkeys)
output="Complete return string: ${state}\n"

if [[ $state == option ]]; then
	output+="Only Option down."
elif [[ $state == option-shift ]]; then
	output+="Option and Shift down, nothing else."
elif [[ $state == *option*command ]]; then
	output+="Option and Command down, possibly other keys too.\n"
elif [[ $state == *option* ]]; then
	output+="Option down, possibly other keys too."
fi

echo "${output}"
```

## Build

Compile with `swiftc <path/to/modifierkeys.swift>` or try the binary from Releases, if available.

Tested on macOS Ventura and Sonoma (Intel).

---

I'm not too familiar with Swift and the macOS API, so any suggestions for improvements are welcome.

[^1]: Example doc: https://support.apple.com/en-us/HT201236  
Opinion: https://leancrew.com/all-this/2017/11/modifier-key-order/

