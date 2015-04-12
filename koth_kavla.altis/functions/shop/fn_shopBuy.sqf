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
		0 = [format["<t size='0.8' shadow='0' color='#99ffffff'>%1</t>", getText(configFile >> "CfgVehicles" >> _className >> "displayName")], 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
	};
	case 1: {
		hint str _className;
	};
};