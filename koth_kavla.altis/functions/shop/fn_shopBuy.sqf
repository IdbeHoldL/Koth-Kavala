/*
	File: fn_shopBuy.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_store","_className"];

_className = lbData[1003,(lbCurSel 1003)];

switch (KOTH_store) do {
	case 0: {
		_vehicle = createVehicle [_className, (position player), [], 10, "NONE"];
	};
	case 1: {
		_info = [_className] call KOTH_fnc_fetchCfgInfo;
		
		switch(_info select 4) do {
			case "CfgWeapons": { player addWeapon (_className); };
			case "CfgMagazines": { player addMagazines [(_className), 1]};
		};	
	};
};