os.loadAPI("utils/globe");
os.loadAPI("utils/devices");
os.loadAPI("utils/keylock");

local item = "computercraft:disk";
local player = "@p"
local quantity = "1";

local function init()
	while true do -- Start an endless loop
	  local event = os.pullEvent("redstone") -- Yield the computer until some redstone changes
	  -- We don't care what the event returns, since the first variable will be "redstone" and the rest will be nil. 

	  if event == "redstone" and rs.getInput("front") then
	  	keylock.giveKey(player, item, quantity);
	  else
	  	print("Nope!");
	  end
	end
end

init();
