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
	
	};
};