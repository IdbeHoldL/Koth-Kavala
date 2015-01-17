
waitUntil {!isNull player && player == player};


[] call compile PreprocessFileLineNumbers "config\config.sqf";

[] call client_fnc_hudUpdate;
[] call client_fnc_playerMarker;
[] call client_fnc_autoSave;
[] spawn client_fnc_thirdPersonView;

removeAllWeapons player;
removeBackpack player;
player addweapon "arifle_Katiba_C_F";
player addmagazine "30Rnd_65x39_caseless_green";
player addmagazine "30Rnd_65x39_caseless_green";
player addmagazine "30Rnd_65x39_caseless_green";
player addweapon "hgun_P07_F";
player addmagazine "16Rnd_9x21_Mag";
player addmagazine "16Rnd_9x21_Mag";
player addmagazine "16Rnd_9x21_Mag";
player additem "FirstAidKit";

player_stats_got = 0;
[[player], "player_fnc_loadStats", false, false] spawn BIS_fnc_MP;

player addEventHandler ["respawn", {_this spawn clientEvents_fnc_spawn}];
player addMPEventHandler ["mpkilled", {_this spawn clientEvents_fnc_killed}];
[] call compile PreprocessFileLineNumbers "init\actions\init.sqf";


"player_stats_add" addPublicVariableEventHandler {
	_xp = player_stats select 0;
	_kills = player_stats select 1;
	_deaths = player_stats select 2;
	
	_stats = _this select 1;
	
	_addxp = _stats select 0;
	_addkills = _stats select 1;
	_adddeaths = _stats select 2;

	_newxp = _xp + _addxp;
	_newkills = _kills + _addkills;
	_newdeaths	= _deaths + _adddeaths;
		
	player_stats = [_newxp, _newkills, _newdeaths];
};

"player_equip" addPublicVariableEventHandler {
	_data = _this select 0;

	_headgear = _data select 1;
	_goggles = _data select 2;

	_uniform = _data select 3;
	_vest = _data select 4;
	_backpack = _data select 5;

	_uniformWeapons = _data select 6;
	_uniformItems = _data select 7;
	_uniformMagazines = _data select 8;

	_vestWeapons = _data select 9;
	_vestItems = _data select 10;
	_vestMagazines = _data select 11;

	_backpackWeapons = _data select 12;
	_backpackItems = _data select 13;
	_backpackMagazines = _data select 14;

	_primaryWeapon = _data select 15;
	_secondaryWeapon = _data select 16;
	_handgunWeapon = _data select 17;

	_primaryWeaponItems = _data select 18;
	_secondaryWeaponItems = _data select 19;
	_handgunItems = _data select 20;
	_assignedItems = _data select 21;

	_loadedMagazines = _data select 22;

	removeAllWeapons player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadgear player;
			
	sleep 0.1;

	player addHeadgear _headgear;
	player addGoggles _goggles;

	player addUniform _uniform;
	player addVest _vest;
	player addBackpack _backpack;

	{
		player removeItemFromBackpack _x;
	} forEach backpackItems player;


	_uniformContainer = uniformContainer player;
	_vestContainer = vestContainer player;
	_backpackContainer = backpackContainer player;
	if (_uniform != "") then
	{
		{
			_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		} forEach _loadedMagazines;
	};

	player addWeapon _primaryWeapon;
	player addWeapon _secondaryWeapon;
	player addWeapon _handgunWeapon;
	removeAllPrimaryWeaponItems player;
	removeAllHandgunItems player;

	{
		if (_x != "") then
		{
			player addPrimaryWeaponItem _x;
		};
	} forEach _primaryWeaponItems;
	{
		if (_x != "") then
		{
			player addPrimaryWeaponItem _x;
		};
	} forEach _secondaryWeaponItems;
	{
		if (_x != "") then
		{
			player addHandgunItem _x;
		};
	} forEach _handgunItems;
	{
		if (_x != "") then
		{
			player linkItem _x;
		};
	} forEach _assignedItems;
	{

		_uniformContainer addWeaponCargoGlobal [_x, (_uniformWeapons select 1) select _forEachIndex];
	} forEach (_uniformWeapons select 0);
	{
		_uniformContainer addItemCargoGlobal [_x, (_uniformItems select 1) select _forEachIndex];
	} forEach (_uniformItems select 0);
	{
		if ((count _x) > 0) then
		{
			_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		};
	} forEach _uniformMagazines;
	{
		_vestContainer addWeaponCargoGlobal [_x, (_vestWeapons select 1) select _forEachIndex];
	} forEach (_vestWeapons select 0);
	{
		_vestContainer addItemCargoGlobal [_x, (_vestItems select 1) select _forEachIndex];
	} forEach (_vestItems select 0);
	{
		if ((count _x) > 0) then
		{
			_vestContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		};
	} forEach _vestMagazines;

	{
		_backpackContainer addWeaponCargoGlobal [_x, (_backpackWeapons select 1) select _forEachIndex];
	} forEach (_backpackWeapons select 0);
	{
		_backpackContainer addItemCargoGlobal [_x, (_backpackItems select 1) select _forEachIndex];
	} forEach (_backpackItems select 0);
	{
		if ((count _x) > 0) then
		{
			_backpackContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
		};
	} forEach _backpackMagazines;				
};

