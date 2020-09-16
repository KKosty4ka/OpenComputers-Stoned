--local computer, component = require("computer"), require("component")
local cp, cl = component.proxy, component.list
local gpu = cp(cl("gpu")())
local eeprom = cp(cl("eeprom")())

local resX, resY = gpu.maxResolution()
gpu.setResolution(resX, resY)

local function input(x, y)
    local output = ""
    local running = true
    
    while running do
        local e, _, c, _ = computer.pullSignal()
        if e == "key_down" then
            if c == 13 then
                running = false
            elseif string.match(string.char(c), "^[0-9a-zA-ZабвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ/.]$") then
                output = output .. string.char(c)
            end
            
            gpu.set(x, y, "Key: " .. output)
        end
    end
    
    return output
end

gpu.setBackground(0x000000)
gpu.setForeground(0xFF0000)

gpu.fill(1, 1, resX, resY, " ")


gpu.set(1, 1, "You became victim of STONED BOOTKIT!")
gpu.set(1, 2, "————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————")
gpu.set(1, 3, "If you see this text, then your brain are no longer aceessible, because they")
gpu.set(1, 4, "have been encrypted.  Perhaps you are busy looking for a way to recover your")
gpu.set(1, 5, "brain, but don't waste your time.  Nobody can recover your brain without our")
gpu.set(1, 6, "decryption service.")

gpu.set(1, 8, "We guarantee that you can recover all your brain safely and easily.  All you")
gpu.set(1, 9, "need to do is submit the payment and purchase the decryption key.")

gpu.set(1, 11, "Please follow the instructions:")

gpu.set(1, 13, "1. Throw your computer out the window")

gpu.set(1, 15, "If you already purchased your key, please enter it below.")
gpu.set(1, 16, "Key: ")

input(1, 16)
error("Invalid key! Please try again.", 0)