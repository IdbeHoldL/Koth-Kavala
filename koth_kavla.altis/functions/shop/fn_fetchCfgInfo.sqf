/*
	File: fn_fetchCfgInfo.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_class","_cfg","_info"];

_class = [_this,0,"",[""]] call BIS_fnc_param;
_info = [];

_cfg = switch (true) do {
	case (isClass (configFile >> "CfgMagazines" >> _class)) : {"CfgMagazines";};
	case (isClass (configFile >> "CfgWeapons" >> _class)) : {"CfgWeapons";};
	case (isClass (configFile >> "CfgVehicles" >> _class)) : {"CfgVehicles";};
	case (isClass (configFile >> "CfgGlasses" >> _class)) : {"CfgGlasses";};
};

_info pushback _class;
_info pushback getText(configFile >> _cfg >> _class >> "displayName");
_info pushback getText(configFile >> _cfg >> _class >> "picture");
_info pushback getText(configFile >> _cfg >> _class >> "descriptionshort");
_info;