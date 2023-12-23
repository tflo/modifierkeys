# modifierkeys

This is a modern version of the Carbon [keys.m](https://gist.github.com/ttscoff/3265170) and possibly other similar programs.

The program returns the state of the following modifier keys on macOS:
- Caps Lock
- Function (fn)
- Control
- Option
- Shift
- Command

With all modifier keys down, it will return: “capslock-function-control-option-shift-command”.
The order will remain the same, no matter which keys are down. For example, with only Control and Command down, the output is: `control-command`.

The order `control-option-shift-command` corresponds to the traditional order as used by Apple.
Example doc: https://support.apple.com/en-us/HT201236
Opinion: https://leancrew.com/all-this/2017/11/modifier-key-order/

## Usage example:

```shell
#!/usr/bin/env zsh

sleep 2
state=$(modifierkeys)
output="Complete return string: ${state}\n"

if [[ $state == option ]]; then
	output+="Only Option down."
elif [[ $state == *option*command ]]; then
	output+="Option and Command down.\n"
elif [[ $state == *option* ]]; then
	output+="Option down.\n"
fi

echo $output
```

*Compile with `swiftc <path/to/modifierkeys.swift>` or download the binary from Releases, if available.*

Tested on macOS Ventura and Sonoma (Intel).

---

I'm not too familiar with Swift, so any suggestions for improvements or pointers to bad practice in my code are welcome.