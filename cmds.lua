local gpu = component.proxy(component.list("gpu")())
local resX, resY = gpu.getResolution()

gpu.setBackground(0x000000)
gpu.setForeground(0xFFFFFF)

gpu.fill(1, 1, resX, resY, " ")
gpu.set(1, 1, "Your PC is now Stoned... again!")

computer.pullSignal(math.huge)
