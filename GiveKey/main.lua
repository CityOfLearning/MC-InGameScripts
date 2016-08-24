os.loadAPI("utils/globe");
os.loadAPI("utils/devices");

local item = "computercraft:disk";
local player = "@p"
local quantity = "1";

local function init()
	while true do -- Start an endless loop
	  local event = os.pullEvent("redstone") -- Yield the computer until some redstone changes
	  -- We don't care what the event returns, since the first variable will be "redstone" and the rest will be nil. 

	  if event == "redstone" and rs.getInput("front") then
	  	giveKey();
	  else
	  	print("Nope!");
	  end
	end
end

function giveKey(p,k,q)
	_p = p or player;
	_k = k or item;
	_q = q or quantity;

	if (testKey(_p, _k) == true) then
		commands.exec("tell ".._p.." You already have this key!");
	else
		commands.exec("give ".._p.." ".._k.." ".._q);
	end
end

function testKey(p,k)
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
