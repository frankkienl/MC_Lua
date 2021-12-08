--[[  Power Monitoring Program Written By: 0_Mr_Redstone_0  AKA  MoJoCreatior
This code is considered free for use both commercial and private and can be redistributed so long as it meats following criteria:
1: 0_Mr_Redstone_0 and MoJoCreatior are credited as the original authors
2: You do not try to take full ownership of the code/written program
3: If you modify the code for re-upload you must provide it under the same conditions. as in- Open Source, and credit me as original author]]

program = "Power Monitor"
setup = "f2ty2kg3"
program = "trrwXhMX"

--functions
function intro()
    term.setBackgroundColour(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    term.setTextColour(colors.green)
    print(program.." -Written By: 0_Mr_Redstone_0  AKA  MoJoCreatior\n")
end

function install()
    fs.delete("setup.lua")
    fs.delete("program.lua")
    fs.delete("config/")
    shell.run("pastebin get "..setup.." setup.lua")
    shell.run("pastebin get "..program.." program.lua")
    fs.delete("startup")
    startup = fs.open("startup","w")
    startup.write('shell.run("setup.lua")')
    startup.close()
    if fs.exists("config/update") == true then print("Updated")
    else print("Installed")
    end
end

function configSave(name,data)
    cfg = fs.open("config/"..name,"w")
    cfg.write(data)
    cfg.close()
end

function RFAPI()
    rfAPI = false
    if peripheral.find("tile_thermalexpansion_cell_resonant_name") == nil then
    else cube = peripheral.find("tile_thermalexpansion_cell_resonant_name")
        rfAPI = true
    end
    if peripheral.find("tile_blockcapacitorbank_name") == nil then
    else cube = peripheral.find("tile_blockcapacitorbank_name")
        rfAPI = true
    end
    if peripheral.find("extrautils_generatorsolar") == nil then
    else cube = peripheral.find("extrautils_generatorsolar")
        rfAPI = true
    end
end

function IC2Check()
    IC2 = false
    if peripheral.find("mfsu") == nil then
    else cube = peripheral.find("mfsu")
        IC2 = true
    end
    if peripheral.find("mfe") == nil then
    else cube = peripheral.find("mfe")
        IC2 = true
    end
    if peripheral.find("cesu") == nil then
    else cube = peripheral.find("cesu")
        IC2 = true
    end
    if peripheral.find("batbox") == nil then
    else cube = peripheral.find("batbox")
        IC2 = true
    end
end

function mekanismCheck()
    mekanism = false
    if peripheral.find("Basic Energy Cube") == nil then
    else cube = peripheral.find("Basic Energy Cube")
        mekanism = true
    end
    if peripheral.find("Advanced Energy Cube") == nil then
    else cube = peripheral.find("Advanced Energy Cube")
        mekanism = true
    end
    if peripheral.find("Elite Energy Cube") == nil then
    else cube = peripheral.find("Elite Energy Cube")
        mekanism = true
    end
    if peripheral.find("Ultimate Energy Cube") == nil then
    else cube = peripheral.find("Ultimate Energy Cube")
        mekanism = true
    end
    if peripheral.find("Induction Matrix") == nil then
    else cube = peripheral.find("Induction Matrix")
        mekanism = true
    end
end


RFAPI()
IC2Check()
mekanismCheck()

intro()

if peripheral.find("monitor") == nil then
    print("Connect Monitor!") print("terminating") sleep(2.5) os.reboot()
end

if rfAPI == true then
elseif IC2 == true then
elseif mekanism == true then
else print("Connect Energy Cell!") print("terminating") sleep(2.5) os.reboot()
end

install()
os.reboot()