/*
	File: fn_playerLoad.sqf
	Author: BAROD
	Description:
		NONE
	Parameters:
		NONE
*/

private ["_player", "_clientID", "_playerUID", "_playerName"];

_player = _this select 0;
_playerUID = getPlayerUID _player;
_clientID = owner _player;
_playerName = [(name _player)] call BAROD_fnc_strip;

_result = ([format["existPlayerData:%1", _playerUID], 2] call BAROD_fnc_async) select 0;

if (!_result) then {
	[format["insertPlayerData:%1:%2:%3:%4", _playerUID, _playerName, [0,0,0,0], []]] call BAROD_fnc_async;
};

_data = [format["selectPlayerData:%1", _playerUID], 2] call BAROD_fnc_async;	

diag_log "LOAD PLAYER DATA";
diag_log "-----------------";
diag_log str _data;
diag_log "-----------------";

[_data,"KOTH_fnc_playerLoad",_clientID,false] call BIS_fnc_MP;