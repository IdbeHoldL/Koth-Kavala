/*
	File: fn_fetchVehInfo.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/


private["_class","_scope","_picture","_displayName","_vehicleClass","_side","_faction","_superClass","_speed","_armor","_seats","_hp","_fuel"];

_class = [_this,0,"",[""]] call BIS_fnc_param;
_info = [];

_info pushback _class;
_info pushback getText(configFile >> "CfgVehicles" >> _class >> "picture");
_info pushback getText(configFile >> "CfgVehicles" >> _class >> "displayName");
_info pushback getText(configFile >> "CfgVehicles" >> _class >> "vehicleClass");
_info pushback getText(configFile >> "CfgVehicles" >> _class >> "descriptionshort");
_info;