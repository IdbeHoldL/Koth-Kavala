/*
	File: fn_handleDisconnect.sqf
	Author: BAROD

	Description:
		...
	Parameters:
		unit: Object
		id: Number
		uid: String
		name: String
*/
private["_unit","_id","_uid"];

_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;
deleteVehicle _unit;
