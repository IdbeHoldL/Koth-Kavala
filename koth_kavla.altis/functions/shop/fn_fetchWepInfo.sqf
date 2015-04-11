/*
	File: fn_fetchVehInfo.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_entity","_cfg","_ret"];

_entity = [_this,0,"",[""]] call BIS_fnc_param;

_info = [];
_cfg = if(isNil {_this select 1}) then {
	switch (true) do {
		case (isClass (configFile >> "CfgMagazines" >> _entity)) : {"CfgMagazines";};
		case (isClass (configFile >> "CfgWeapons" >> _entity)) : {"CfgWeapons";};
		case (isClass (configFile >> "CfgVehicles" >> _entity)) : {"CfgVehicles";};
		case (isClass (configFile >> "CfgGlasses" >> _entity)) : {"CfgGlasses";};
	};
}
	else
{
	_this select 1
};

_info pushback _entity;
_info pushback getText(configFile >> _cfg >> _entity >> "displayName");
_info pushback getText(configFile >> _cfg >> _entity >> "picture");
_info pushback getText(configFile >> _cfg >> _entity >> "descriptionshort");
_info;