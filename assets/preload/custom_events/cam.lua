-- CONFIG
local amount = 20; -- How much to move the camera when an animation is played
local enabled = true; -- Enables/Disables the script

local directions = { -- Add more animations to this if you want
	["left"] = {-amount,0},
	["up"] = {0,-amount},
	["down"] = {0,amount},
	["right"] = {amount,0},
}
local charCams = { -- Where the cameras forthe characters will be, Uncomment this to hardcode your positions
	-- [0]={920,600,"boyfriend"}, -- BF
	-- [1]={500,600,"dad"}, -- Dad
	-- [2]={540,450,"gf"}  -- GF
}

--- Actual script below

local id = 0
local direction = ""
local name = ""
local anim = ""
local idle = {0,0}
function onCreatePost()
	if(not charCams[0]) then
		charCams = { -- Dynamically sets up the camera positiosns if they're not provided
			[0]={getProperty("boyfriend.x") + (getProperty("boyfriend.width") * 0.5),getProperty("boyfriend.y") + (getProperty("boyfriend.height") * 0.25),"boyfriend"}, -- BF
			[1]={getProperty("dad.x") + (getProperty("dad.width") * 0.5),getProperty("dad.y") + (getProperty("dad.height") * 0.25),"dad"}, -- Dad
			[2]={getProperty("gf.x") + (getProperty("gf.width") * 0.5),getProperty("gf.y") + (getProperty("gf.height") * 0.25),"gf"}  -- GF
		}
	end
	onUpdate(0,2)
end
function onUpdate(_,force)
    if enabled then
    	id = (force or mustHitSection and 0 or gfSection and 2 or 1)
    	char = charCams[id]
    	direction = idle
    	anim = string.lower(getProperty(char[3] .. ".animation.curAnim.name"))

		for i,v in pairs(directions) do
			if(string.match(anim,i)) then direction = v; print(i); break end
		end
		triggerEvent('Camera Follow Pos',char[1] + direction[1],char[2] + direction[2])
    end
end


-- Funni note cam
-- Made by bbpanzu
-- Improved by Superpowers04#3887
-- Keep credits or I'll steal your kneecaps