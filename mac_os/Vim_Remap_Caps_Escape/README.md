# Xcode to Map Vim Keys


There is no built-in way to add custom key mappings in Xcode 13’s Vim Mode.

This is a workaround. 

It depends on `karabiner-elements`.



```bash
    brew install --cask karabiner-elements
```

Also, follow instructions in [getting-started/installation/](https://karabiner-elements.pqrs.org/docs/getting-started/installation/) for making sure the karabiner permissions are set.


Put this in `~/.config/karabiner/assets/complex_modifications/jk_Xcode.json`


```json
{
  "title": "Xcode vim mode, maps Esc -> 'jk'",
  "rules": [
    {
      "description": "jk to escape for xcode",
      "global": {
        "ask_for_confirmation_before_quitting": true,
        "check_for_updates_on_startup": true,
        "show_in_menu_bar": true,
        "show_profile_name_in_menu_bar": false,
        "unsafe_ui": false
      },
      "manipulators": [
        {
          "conditions": [
            {
              "bundle_identifiers": [
                "com.apple.dt.Xcode"
              ],
              "type": "frontmost_application_if"
            },
            {
              "name": "j_pressed",
              "type": "variable_unless",
              "value": 1
            }
          ],
          "from": {
            "key_code": "j"
          },
          "parameters": {
            "basic.to_delayed_action_delay_milliseconds": 500
          },
          "to": [
            {
              "set_variable": {
                "name": "j_pressed",
                "value": 1
              }
            }
          ],
          "to_delayed_action": {
            "to_if_invoked": [
              {
                "set_variable": {
                  "name": "j_pressed",
                  "value": 0
                }
              }
            ]
          },
          "type": "basic"
        },
        {
          "conditions": [
            {
              "bundle_identifiers": [
                "com.apple.dt.Xcode"
              ],
              "type": "frontmost_application_if"
            },
            {
              "name": "j_pressed",
              "type": "variable_if",
              "value": 1
            }
          ],
          "from": {
            "key_code": "k"
          },
          "to": [
            {
              "set_variable": {
                "name": "j_pressed",
                "value": 0
              }
            },
            {
              "key_code": "escape",
              "modifiers": []
            }
          ],
          "type": "basic"
        }
      ]
    }
  ]
}
```
Finally, restart Karabiner & restart Xcode. Enjoy 🎉🎉


## References:


- https://karabiner-elements.pqrs.org/docs/json/root-data-structure/
- https://karabiner-elements.pqrs.org/docs/getting-started/installation/
