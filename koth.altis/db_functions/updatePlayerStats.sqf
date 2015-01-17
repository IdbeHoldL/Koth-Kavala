if (isServer) then
{
	_unit = _this select 0;
	_uid = getPlayerUID _unit;
	_stats = _this select 1;
	
	_xp = _stats select 0;
	_kills = _stats select 1;
	_deaths = _stats select 2;
	
	_query = [format["UpdatePlayerStats:%1:%2:%3:%4", _uid,_xp,_kills,_deaths], 2] call async;	
};

    
