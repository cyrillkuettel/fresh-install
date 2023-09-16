# Creating System-Wide Keyboard Shortcut To Launch Applications

    Open Automator (you can find it in the Applications folder or by using Spotlight search).

    Create a new service:
        Choose "Service" as the document type.
        In the "Service receives selected" dropdown, choose "no input" or "text".
        Make sure that "in" is set to "any application".

    Search for "Run AppleScript" in the actions library on the left, and drag it to the workflow area on the right.

    Replace the default AppleScript code with the following code:

```applescript
on run {input, parameters}
    tell application "Terminal"
        do script ""
        activate
    end tell
end run
```

Save your Service to whatever name you want.

Navigate to your System Preferences > 'Keyboard Shortcuts' tab.

Click on the 'Services' tab in the left side bar and all your services will populate. Navigate to the 'General' section, and since it's a newly created service, it will automatically be turned on by default. Here is where you can set your keyboard shortcut. [THERE WILL NOT BE ONE BY DEFAULT]
