# cc-music-player
Simple music player for ComputerCraft.
- Require a speaker to be connected.
- Optionally connect with advanced monitor.
- Use click/touch on advanced computers.

![](https://github.com/Konijima/cc-music-player/blob/master/Screenshot_1.png?raw=true)

## Install
```bash
wget https://raw.githubusercontent.com/Konijima/cc-music-player/master/music.lua
```

---

## Run
```bash
music
```

---

## Run without installing
```bash
wget run https://raw.githubusercontent.com/Konijima/cc-music-player/master/music.lua
```

---

## Startup
To auto-run on startup, add this line to your `startup.lua` file:
```lua
-- run installed
shell.run('music')

-- OR

-- run without installing
shell.run('wget', 'run', 'https://raw.githubusercontent.com/Konijima/cc-music-player/master/music.lua')
```
