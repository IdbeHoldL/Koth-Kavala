/*




*/

_player = _this select 0;
_uid = getPlayerUID _player;
	
_startTime = diag_tickTime;
while {true} do
{
	sleep 0.1;
	_uid = getPlayerUID _player;
	if (_uid != "") exitWith {};
	if (diag_tickTime - _startTime >= 60) exitWith {};
};
	
if (_uid == "") exitWith {};
	
_name = [(name _player)] call extDB_fnc_strip;
	
_result = ([format["existPlayerInfo:%1", _uid], 2] call extDB_fnc_async) select 0;
	
if (!_result) then {
	_xp = 0;
	_kills = 0;
	_deaths = 0;
	[format["insertPlayerStats:%1:%2:%3:%4:%5", _uid, _name, _xp, _kills, _deaths], 2] call extDB_fnc_async;
};	

//get saved stats from server
_query = [format["selectPlayerStats:%1", _uid], 2] call extDB_fnc_async;	
	
_xp = _query select 0;
_kills = _query select 1;
_deaths = _query select 2;
	
player_stats_add = [_xp,_kills,_deaths];
owner _player publicVariableClient "player_stats_add";
player_stats_got = 1;
owner _player publicVariableClient "player_stats_got";