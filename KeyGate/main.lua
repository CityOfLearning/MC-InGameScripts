os.loadAPI("utils/globe");
os.loadAPI("utils/devices");
os.loadAPI("utils/keylock");

player = "@p"
item = "computercraft:disk"
gate = "";
input = "";

local function init()
	while true do -- Start an endless loop
	  local event = os.pullEvent("redstone") -- Yield the computer until some redstone changes
	  -- We don't care what the event returns, since the first variable will be "redstone" and the rest will be nil. 

	  if event == "redstone" and rs.getInput(input) then
	  	if (keylock.testKey(player, item) == true) then
	  		rs.setOutput(gate, true) --Door Connection
	  	else
	  		rs.setOutput(gate, false)
	  		commands.exec("tell "..player.." You need to get the key before you can go on!");
	  	end
	  else
	  	--do nothing
	  end
	end
end

init();
