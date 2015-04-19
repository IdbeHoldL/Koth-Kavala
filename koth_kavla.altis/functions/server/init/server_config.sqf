/*
	File: server_config.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

_config = ["selectConfigData:KOTH", 2] call KOTH_asyncCall;	

_arry = [];
_fatigue  = _config select 0;
_loadout = _config select 1;

_arry pushback _fatigue;
_arry pushback _loadout;
_arry;