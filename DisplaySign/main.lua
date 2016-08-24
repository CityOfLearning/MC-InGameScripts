--Called by startup shell file in computers
os.loadAPI("utils/globe");
os.loadAPI("utils/devices");

local convArr = {};
table.insert(convArr, "Lever <--> Toggle")
table.insert(convArr, "Levers give power.")
table.insert(convArr, "They can be either")
table.insert(convArr, "ON or OFF")
table.insert(convArr, "We call that a...")
table.insert(convArr, "TOGGLE!")
table.insert(convArr, "----")
table.insert(convArr, "Ready to try it?")
table.insert(convArr, "Flip the lever")
table.insert(convArr, "that's below this")
table.insert(convArr, "lamp ---------->")



mon = devices.getDev("monitor");
mod = devices.getDev("modem");
startX = globe.getVar("curX") or 1;
startY = globe.getVar("curY") or 3;
convoTable = globe.getVar("convoTable") or convArr;

--Entrance Display Text
local function init()
	mon.clear();
	mon.setTextScale(1.25);
	mon.setCursorPos(startX,startY);
	mon.setBackgroundColor(colors.black);
	mon.setTextColor(colors.red);
 	mon.setCursorBlink(true);
end

local function marqueeSign(convoTable)
	local _t = convoTable;
	resetScreen();
	for i=1, #convoTable do
 		local _w, _h = mon.getSize();
 		local _x, _y = mon.getCursorPos();
 		if (_y >= (_h-2)) then
 			mon.scroll(2)
 			mon.setCursorPos(startX, _y);
 		else
 			mon.setCursorPos(startX, _y + 2)
 		end
 		wait(1)
 		mon.write(_t[i]);
 		wait(3)
 	end

 	marqueeSign(convoTable);
end

function resetScreen()
	mon.clear();
	init();
end

function wait(time)
	local _t = time;

	local myTimer = os.startTimer(_t)
	while true do
	  local event, timerID = os.pullEvent("timer")
	  if timerID == myTimer then break end
	end
end

marqueeSign(convoTable);
