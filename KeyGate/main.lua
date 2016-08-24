os.loadAPI("utils/globe");
os.loadAPI("utils/devices");

local function init()
	while true do -- Start an endless loop
	  local event = os.pullEvent("redstone") -- Yield the computer until some redstone changes
	  -- We don't care what the event returns, since the first variable will be "redstone" and the rest will be nil. 

	  if event == "redstone" and rs.getInput("front") then
	  	testKey();
	  else
	  	--do nothing
	  end
	end
end

local function testKey(p,k)
	_p = p or player;
	_k = k or item;

	local test = " {Inventory:[{id:".._k.."}]}";
	
	if (commands.exec("testfor ".._p..test) == true) then
		return true;
	else
		return false;
	end
end

init();
