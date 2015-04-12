/*
	File: fn_shopBuy.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_store","_className"];

_store = lbData[1000,(lbCurSel 1002)];
_className = lbData[1000,(lbCurSel 1003)];

switch (_store) do {
	case "Vehicle Shop": {
		_vehicle = createVehicle [_className, (position player), [], 10, "NONE"];
	};
	case "Weapon Shop": {
		
	};
};