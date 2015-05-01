/*
	File: initServer.sqf
	Author: BAROD
	
	Description:
		Executed only on server when mission is started
	Parameters:
		NONE
*/

["Initialize"] call BIS_fnc_dynamicGroups; 
[] execVM "koth_server\init\server_init.sqf";