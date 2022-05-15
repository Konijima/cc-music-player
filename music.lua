local speaker = peripheral.find('speaker')
local monitor = peripheral.find('monitor')

if not speaker then
    print('Music Player') 
    printError('-  No speaker found!')
    return;
end

local isTouch = term.isColor()
local isMonitorTouch = monitor and monitor.isColor()
local terminal = term
if isMonitorTouch then terminal = monitor end
local current = -1
local playlist = {
    {'Random Menu Song', 'music.menu'},
    {'Random Creative Song', 'music.creative'}, 
    {'Random Game Song', 'music.game'},
    {'Credits Song', 'music.credits'},
    {'Dragon', 'music.dragon'},
    {'11', 'music_disc.11'},
    {'13', 'music_disc.13'},
    {'Blocks', 'music_disc.blocks'},
    {'Cat', 'music_disc.cat'},
    {'Chirp', 'music_disc.chirp'},
    {'Far', 'music_disc.far'},
    {'Mall', 'music_disc.mall'},
    {'Mellohi', 'music_disc.mellohi'},
    {'Pigstep', 'music_disc.pigstep'},
    {'Stal', 'music_disc.stal'},
    {'Strad', 'music_disc.strad'},
    {'Wait', 'music_disc.wait'},
    {'Ward', 'music_disc.ward'},
}

if isMonitorTouch then
    monitor.setTextScale(0.5)
    term.setTextColor(colors.green)
    print('Music player running on Monitor')
end

local function printPlaylist()
    terminal.clear()
    terminal.setCursorPos(1,1)
    terminal.setTextColor(colors.purple)
    if isTouch or isMonitorTouch then
        terminal.write('Music Player (Right click to play)')
    else
        terminal.write('Music Player')
    end
    terminal.setTextColor(colors.white)
    
    for i, v in ipairs(playlist) do
        if i == current then terminal.setTextColor(colors.blue) end
        
        terminal.setCursorPos(1, i +  1)
        terminal.write(i .. ') ' .. v[1])
        terminal.setTextColor(colors.white)
    end
end

local function playIndex(index)
    current = index
    pcall(speaker.playSound, playlist[index][2])
end

local function keyScreen()
    printPlaylist()
    term.write('Index > ')
    local input = read() 
    pcall(playIndex, tonumber(input))
end

local function touchScreen()
    printPlaylist()
    if isMonitorTouch then
        local event, button, x, y = os.pullEvent("monitor_touch")    
        playIndex(y-1)
    else
        local event, button, x, y = os.pullEvent("mouse_click")    
        playIndex(y-1)
    end
end

speaker.stop() -- stop on start
while true do
    if isMonitorTouch or isTouch then
        touchScreen()
    else
        keyScreen()
    end
    sleep(0.1)
end