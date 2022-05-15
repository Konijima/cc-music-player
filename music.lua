local speaker = peripheral.find('speaker')

if not speaker then
    print('Music Player') 
    printError('-  No speaker found!')
    return;
end

local isTouch = term.isColor() 
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

local function playIndex(index)
    current = index 
    speaker.playSound(playlist[index][2])
end

local function printPlaylist()
    term.clear()
    term.setCursorPos(1,1)
    term.setTextColor(colors.white)
    for i, v in ipairs(playlist) do
        if #v == 1 then
            print(v[1])
        else
            if i == current then
                term.setTextColor(colors.blue) 
            end
            print(i .. ') ' .. v[1])
            term.setTextColor(colors .white)
        end
    end
end

local function keyScreen()
    printPlaylist()
    term.write('Index > ')
    local input = read() 
    pcall(playIndex, tonumber(input))
end

local function touchScreen()
    printPlaylist()     
    local event, button, x, y = os.pullEvent("mouse_click")    
    playIndex(y)
end

speaker.stop() -- stop on start
while true do
    if isTouch then
        touchScreen()
    else
        keyScreen()
    end
    sleep(0.1)
end
speaker.stop() -- stop on exit
