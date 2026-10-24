# Pawn & Pixel

Free browser board games developed by Darshan Gajjar, hosted on GitHub Pages at https://darshangajjar003.github.io/games/

| Game | Play | About |
|---|---|---|
| Strike4 | https://darshangajjar003.github.io/games/strike4/ | Four-in-a-row for kids. Play the computer or a friend, pick coin colours, 5 themes and 5 coin materials, music and sound effects. |
| Strike4 (classic look) | https://darshangajjar003.github.io/games/strike4/classic/ | The original Strike4 toy-box look, without the theme picker. |
| Barricade: King of the Hill | https://darshangajjar003.github.io/games/barricade/ | 4 players race to the crown in the centre of an 11×11 board and block each other with barricades. Humans or computer players. |

## Files

- `index.html`: the Pawn & Pixel home page that links to every game.
- `barricade/index.html`: Barricade source.
- `strike4/index.html`: Strike4 source, with themes.
- `strike4/classic.html`: Strike4 source, original look.
- `docs/`: the standalone pages GitHub Pages serves. Generated; don't edit by hand.
- `build.sh`: regenerates everything in `docs/` from the sources.

The game sources are also published as Claude artifacts, which add the page's `<head>` themselves; `build.sh` adds it for GitHub Pages.

## Adding a game

Put its source in a new folder (for example `mygame/index.html`), add a `wrap` line for it in `build.sh`, and add a card for it in the home page `index.html`.

## Updating

```sh
sh build.sh
git add -A
git commit -m "Update games"
git push
```

GitHub Pages republishes within a minute or two.
