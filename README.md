# Barricade: King of the Hill

A 4-player browser board game. Race your pawn to the crown in the centre of an 11×11 board, and place barricades to slow your rivals down. Each seat can be a human (hot-seat on one device) or the computer.

Play it: https://YOUR-USERNAME.github.io/barricade/

## Files

- `index.html`: the game source (also published as a Claude artifact).
- `docs/index.html`: the standalone page GitHub Pages serves. Don't edit it by hand.
- `build.sh`: regenerates `docs/index.html` from `index.html`.

## Updating the game

```sh
sh build.sh
git add -A
git commit -m "Update game"
git push
```

GitHub Pages republishes within a minute or two.
