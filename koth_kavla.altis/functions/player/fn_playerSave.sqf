/*
	File: fn_playerSave.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_data"];

_data = [];
_gear = [];

_data pushback getPlayerUID player;
_data pushback profileName;

_data pushback missionNamespace getVariable "player_stats";

_data pushback _gear;

KOTH_onPlayerSave = _data;
publicvariableServer "KOTH_onPlayerSave";