/*
	File: server_config.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

_config = ["selectConfigData:KOTH", 2] call BAROD_fnc_async;	

_arry = [];
_fatigue = _config select 0;

_arry pushback _fatigue;
_arry;