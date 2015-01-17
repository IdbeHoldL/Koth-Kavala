if (isServer) then 
{		
	_request = _this select 0;
	
	_uid = _request select 0; 

	_ammo = _request select 1; 
	_weapons = _request select 2; 
	_items = _request select 3; 
	_assignitems = _request select 4; 
	_headgear = _request select 5; 
	_goggles = _request select 6; 
	_vest = _request select 7; 
	_vestitems = _request select 8; 
	_uniform = _request select 9; 
	_uniformitems = _request select 10; 
	_backpack = _request select 11; 
	_packitems = _request select 12; 
	_handgunitems = _request select 13; 
	_primarywep = _request select 14; 
	_secondarywep = _request select 15; 
	
	_query = "updatePlayerSaveAll:" + str(_uid)
	+ ":" + str(_ammo) + ":" + str(_weapons) + ":" + str(_items) + ":" + str(_assignitems) + ":" + str(_headgear) + ":" + str(_goggles)
	+ ":" + str(_vest) + ":" + str(_vestitems) + ":" + str(_uniform) + ":" + str(_uniformitems)
	+ ":" + str(_backpack) + ":" + str(_packitems) + ":" + str(_handgunitems) + ":" + str(_primarywep) + ":" + str(_secondarywep);

	[_query] spawn async;
	
};