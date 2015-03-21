_xp = player_stats select 0;
_kills = player_stats select 1;
_deaths = player_stats select 2;
	
_stats = _this select 1;
	
_addxp = _stats select 0;
_addkills = _stats select 1;
_adddeaths = _stats select 2;

_newxp = _xp + _addxp;
_newkills = _kills + _addkills;
_newdeaths	= _deaths + _adddeaths;
		
player_stats = [_newxp, _newkills, _newdeaths];