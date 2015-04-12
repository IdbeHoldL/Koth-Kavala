/*
	File: fn_fetchVehInfo.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_store"];

_store = [(_this select 3),0,"",[""]] call BIS_fnc_param;

disableSerialization;
if(!createDialog "koth_shop") exitWith {};

switch (_store) do {
	case "vehicle_shop": {
		ctrlSetText [1002,"Vehicle Shop"];
		KOTH_store = 0;
		_vehicleList = [["B_Heli_Light_01_F"],["B_Heli_Light_01_F"],["B_Heli_Light_01_F"]];
		_list = ((findDisplay 1000) displayCtrl 1003);
		lbClear _list;

		{						       
			_info = [_x select 0] call KOTH_fnc_fetchCfgInfo;
			_list lbAdd format["%1",(_info select 1)];
			_list lbSetPicture [(lbSize _list)-1,(_info select 2)];
			_list lbSetData [(lbSize _list)-1,_info select 0];
			_list lbSetValue [(lbSize _list)-1,_ForEachIndex];
		} foreach _vehicleList;
	};
	case "weapon_shop": {
		ctrlSetText [1002,"Weapon Shop"];
		KOTH_store = 1;
		_weaponList = [["hgun_Rook40_snds_F"],["hgun_Rook40_snds_F"],["hgun_Rook40_snds_F"]];
		_list = ((findDisplay 1000) displayCtrl 1003);
		lbClear _list;

		{						       
			_info = [_x select 0] call KOTH_fnc_fetchCfgInfo;
			_list lbAdd format["%1",(_info select 1)];
			_list lbSetPicture [(lbSize _list)-1,(_info select 2)];
			_list lbSetData [(lbSize _list)-1,_info select 0];
			_list lbSetValue [(lbSize _list)-1,_ForEachIndex];
		} foreach _weaponList;
	};
	case "clothing_shop": {
		ctrlSetText [1002,"Clothing Shop"];
		KOTH_store = 1;
		_clothingList = [["U_O_FullGhillie_ard"],["U_O_FullGhillie_ard"],["U_O_FullGhillie_ard"]];
		_list = ((findDisplay 1000) displayCtrl 1003);
		lbClear _list;

		{						       
			_info = [_x select 0] call KOTH_fnc_fetchCfgInfo;
			_list lbAdd format["%1",(_info select 1)];
			_list lbSetPicture [(lbSize _list)-1,(_info select 2)];
			_list lbSetData [(lbSize _list)-1,_info select 0];
			_list lbSetValue [(lbSize _list)-1,_ForEachIndex];
		} foreach _clothingList;
	};
};