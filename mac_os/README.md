Override Keyboard Layout in Mac OS
========================

One can use [Ukulele](https://software.sil.org/ukelele/) to customize a keyboard layout by cherry picking something together.

I used swiss german as a base, and added the following keys to the standard position:
- `\` 
- `{` and `}`
- `[`and `]`
- `@`

That is, where one would expect them after decades of using a non-MacOS keyboard. 

## installation

1. copy the `brackets_like_swiss_layout.keylayout` to `/Library/Keyboard\ Layouts`
2. Run the following command, or restart (safer)

```bash
sudo touch /Library/Keyboard Layouts
```


Go to system preferences -> keyboard layout -> Others and select 'Swiss German
Copy'
If it does not appear, Restart the computer.

Finally, activate it in the top menu bar on the right, there's a keyboard symbol.


tested with MacBook Pro 2018 (macOS Monterey Version 12.6)
