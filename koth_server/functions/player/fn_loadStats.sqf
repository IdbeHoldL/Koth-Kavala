_player = _this select 0;
_uid = getPlayerUID _player;

_startTime = diag_tickTime;

while {true} do {
	sleep 0.1;
	_uid = getPlayerUID _player;
	if (_uid != "") exitWith {};
	if (diag_tickTime - _startTime >= 60) exitWith {};
};
	
if (_uid isEqualto "") exitWith {};

_clientID = owner _player;
_name = [(name _player)] call HIVE_fnc_strip;
	
_result = ([format["existPlayerInfo:%1", _uid], 2] call HIVE_fnc_async) select 0;
	
if (!_result) then {
	_xp = 0;
	_kills = 0;
	_deaths = 0;
	[format["insertPlayerStats:%1:%2:%3:%4:%5", _uid, _name, _xp, _kills, _deaths], 2] call HIVE_fnc_async;
};	

[[_clientID], "KOTH_fnc_MPupdate", _clientID ,false , false] call KOTH_fnc_MP;