//get saved stats from server
_query = [format["selectPlayerStats:%1", _uid], 2] call HIVE_fnc_async;	
	
_xp = _query select 0;
_kills = _query select 1;
_deaths = _query select 2;
	
player_stats = [_xp,_kills,_deaths];
owner _player publicVariableClient "player_stats";