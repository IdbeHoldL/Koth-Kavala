if (isServer) then
{
	_unit = _this select 0;
	_uid = getPlayerUID _unit;
	
	_startTime = diag_tickTime;
	while {true} do
	{
		sleep 0.1;
		_uid = getPlayerUID _unit;
		if (_uid != "") exitWith {};
		if (diag_tickTime - _startTime >= 60) exitWith {};
	};
	
	if (_uid == "") exitWith {};
	
	_name = [(name _unit)] call strip;
	
	_result = [format["existPlayerInfo:%1", _uid], 2] call async;	
	
	if (!_result) then {
		[format["insertPlayerStats:%1:%2", _uid, _name], 2] call async;
	};	

	//get saved stats from server
	_query = [format["selectPlayerStats:%1", _uid], 2] call async;	
	
	_xp = _query select 0;
	_kills = _query select 1;
	_deaths = _query select 2;
	
	player_stats_add = [_xp,_kills,_deaths];
	owner _unit publicVariableClient "player_stats_add";
	player_stats_got = 1;
	owner _unit publicVariableClient "player_stats_got";
};