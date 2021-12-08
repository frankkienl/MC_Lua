-- pm Packagemanager
-- author: FrankkieNL
-- version: 0.3

baseUrl = "http://frankkie.nl/mclua/pm/"

function printUsage()
    print("pm Packagemanager\nUsage:\npm install <name> - Install pak with name.")
end

function isEmpty(string)
    return string == nil or string == ''
end

function download(appName)
    local handle = http.get(baseUrl..appName..".lua")
    local data = handle.readAll()
    handle.close()
    return data
end

function install(appName, downloaded)
    local handle = fs.open(appName, "w")
    handle.write(downloaded)
    handle.flush()
    handle.close()
    print("installed " .. appName .. " !")
end

local args = { ... }
if #args < 2 then
    printUsage()
    return
end

local action = shell.resolve(args[1])
local appName = shell.resolve(args[2])

if (action == "install") then
    local downloaded = download(appName)
    if isEmpty(downloaded) then
        print("Download Error")
    else
        install(appName, downloaded)
    end
end

