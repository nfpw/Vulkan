print("Getting Vulkan's source...\10Sending GET http request...\10")
local i = getInternet('CEVersionCheck')
local src = i.getURL("https://raw.githubusercontent.com/InfernusScripts/Vulkan/main/source.lua")
print("Checking...\10")
local function load(source, failReason)
    local s,e = loadstring(source)
    if not s and e then
        print("Failed to "..failReason..":\10"..e.."\10")
        return false
    elseif s then
        coroutine.wrap(s)()
        return true
    end
    return false
end
if src then
    local s = load(src,"load Vulkan.\10Please support devs if you see that error")
    if s then
        io.open("localCopy.lua","w"):write(src)
        print("Updated local copy!")
    else
        print("Due to an error, loading a local copy.")
        load(table.pack(io.open("localCopy.lua","r"):read("*a"))[1],"load local copy.\10Looks like the local copy don't exist or it is corrupted.\10Please, support us if you see that error")
    end
else
    print("Failed to get Vulkan's source code.\10Looks like something is wrong with your wifi or the file got corrupted.\10\10Anyways, loading the local copy...\10")
    load(table.pack(io.open("localCopy.lua","r"):read("*a"))[1],"load local copy.\10Looks like the local copy don't exist or it is corrupted.\10Please, support us if you see that error")
end
