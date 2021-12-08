-- planter Plant trees
-- author: FrankkieNL
-- version: 0.2
-- Put fuel in (turtle inventory) slot 1;
-- Put saplings in slot 8 and higher

-- Find first slot that's filled
function getFilledSlot(minSlot, maxSlot)
    minSlot = minSlot or 1
    maxSlot = maxSlot or 16
    for i = minSlot, maxSlot do
        if turtle.getItemCount(i) > 0 then
            return i
        end
    end
    return minSlot
end

function refuel()
    if turtle.getItemCount(1) > 0 then
        turtle.select(1)
        turtle.refuel()
        print("refuled")
    end
end

function placeSapling()
    if turtle.back() then
        local saplingSlot = getFilledSlot(8)
        if turtle.getItemCount(saplingSlot) < 0 then
            print("Out of saplings!!")
            exit()
            return
        end
        turtle.select(saplingSlot)
        turtle.place()
    else
        print("Can't move back!!")
        if turtle.getFuelLevel() < 1 then
            print("Out of fuel !!")
        end
        exit()
        return
    end
end

function rotateIfNeeded()
    -- geen block voor de turtle?
    -- dan omdraaien en naar achter lopend planten
    if not turtle.detect() then
        turtle.turnLeft()
        turtle.turnLeft()
        print("rotated.")
    end
end

function start()
    print("Start planter...")
    refuel()
    rotateIfNeeded()
    while true do
        placeSapling()
    end
end

start()