/*
	File: fn_initEventHandlers.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

player addEventHandler["Respawn",{_this call KOTH_fnc_onRespawn}];
player addEventHandler ["Killed", {_this spawn KOTH_fnc_onKilled }];

//Keys event handlers
(findDisplay 46) displayAddEventHandler["KeyDown",KOTH_fnc_onKeyDown];