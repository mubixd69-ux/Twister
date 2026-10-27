# TWISTER

a 2d platformer where you can flip gravity whenever you want. walk on the ceiling, fall upwards, and try not to get confused about which way is down

**play it here:** https://mubixd.itch.io/twister

## how to play

| key | what it does |
|---|---|
| [A] / [D] | move |
| [Space] | jump |
| [Left Click] | flip gravity |

grab coins, reach the end of each level and see how fast you can finish. after every level you get a stats screen with your coins and time, and there's a little ending screen after the last one.

## screenshots

<img width="1153" height="649" alt="image" src="https://github.com/user-attachments/assets/5eca2a36-96f5-4444-a92d-c238b5639d1b" /> <img width="1153" height="651" alt="image" src="https://github.com/user-attachments/assets/8708c069-47d7-47d6-9e82-81f15ab1c087" /> <img width="1148" height="646" alt="image" src="https://github.com/user-attachments/assets/0afebe55-0fb5-48b6-9ffa-e2353a225f71" />




## how this was made

This game was made in godot!

some stuff that gave me trouble:

- **the gravity flip.** just negating gravity felt awful, because if you flipped mid-jump you'd either get launched or barely move. i ended up rescaling your vertical speed on flip and giving it a minimum push so it always feels responsive.
- **the typewriter text on the stats screen.** the effect kept pausing at the end because it was counting BBCode tags like `[b]` as letters. switching to `get_parsed_text()` fixed it.
- **the cooldown bar flipping upside down** along with the player, since the sprite gets flipped on twist. putting it in a CanvasLayer fixed that.


Ai was used strictly for debugging


This was made by mubixd69-ux
