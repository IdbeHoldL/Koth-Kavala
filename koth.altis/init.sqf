enableSaving [false, false];

//global vars
player_stats_add = [0,0,0];
player_stats_got = 0;
player_stats = [0,0,0];
player_equip = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];
player_vcooldown = false;
player_savecooldown = false;
player_loadoutcooldown = false;

if(isNil "spawntruck_blu") then {spawntruck_blu = 0;};
if(isNil "spawntruck_red") then {spawntruck_red = 0;};
if(isNil "spawntruck_ind") then {spawntruck_ind = 0;};

//compile functions
getAllWeapons = compile preprocessFileLineNumbers "other_functions\getAllWeapons.sqf";
formatArray = compile preprocessFileLineNumbers "other_functions\formatArray.sqf";
displayMessage = compile preprocessFileLineNumbers "other_functions\displayMessage.sqf";
getRankInfo = compile preprocessFileLineNumbers "other_functions\getRankInfo.sqf";
getWeaponInfo = compile preprocessFileLineNumbers "other_functions\getWeaponInfo.sqf";
respawnTruck = compile preprocessFileLineNumbers "other_functions\respawnTruck.sqf";
deleteWreck = compile preprocessFileLineNumbers "other_functions\deleteWreck.sqf";
despawnVehicle = compile preprocessFileLineNumbers "other_functions\despawnVehicle.sqf";

if(isServer) then
{
	[] execVM "db_functions\init_server.sqf";
	strip = compile preprocessFileLineNumbers "db_functions\strip.sqf";
	async = compile preprocessFileLineNumbers "db_functions\async.sqf";
	equipLoadout = compile preprocessFileLineNumbers "db_functions\equipLoadout.sqf";
	saveLoadout = compile preprocessFileLineNumbers "db_functions\saveLoadout.sqf";
	getPlayerStats = compile preprocessFileLineNumbers "db_functions\getPlayerStats.sqf";
	updatePlayerStats = compile preprocessFileLineNumbers "db_functions\updatePlayerStats.sqf";	
	"bluf" spawn respawnTruck;
	"redf" spawn respawnTruck;
	"indf" spawn respawnTruck;
};



waitUntil {!isNull player};
	
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
		//player addMagazine _x;
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

// Uniform Cargo
{
	diag_log format["UW :%1", _x];
	_uniformContainer addWeaponCargoGlobal [_x, (_uniformWeapons select 1) select _forEachIndex];
} forEach (_uniformWeapons select 0);
{
	diag_log format["UI :%1", _x];
	_uniformContainer addItemCargoGlobal [_x, (_uniformItems select 1) select _forEachIndex];
} forEach (_uniformItems select 0);

{
	diag_log format["UM :%1", _x];
	if ((count _x) > 0) then
	{
		_uniformContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	};
} forEach _uniformMagazines;

{
	diag_log format["VW :%1", _x];
	_vestContainer addWeaponCargoGlobal [_x, (_vestWeapons select 1) select _forEachIndex];
} forEach (_vestWeapons select 0);
{
	diag_log format["VI :%1", _x];
	_vestContainer addItemCargoGlobal [_x, (_vestItems select 1) select _forEachIndex];
} forEach (_vestItems select 0);
{
	diag_log format["VM :%1", _x];
	if ((count _x) > 0) then
	{
		_vestContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	};
} forEach _vestMagazines;

// Backpack Cargo
{
	diag_log format["BW :%1", _x];
	_backpackContainer addWeaponCargoGlobal [_x, (_backpackWeapons select 1) select _forEachIndex];
} forEach (_backpackWeapons select 0);
{
	diag_log format["BI :%1", _x];
	_backpackContainer addItemCargoGlobal [_x, (_backpackItems select 1) select _forEachIndex];
} forEach (_backpackItems select 0);
{
	diag_log format["BM :%1", _x];
	if ((count _x) > 0) then
	{
		_backpackContainer addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	};
} forEach _backpackMagazines;
				
};

player addEventHandler ["respawn", {_this execVM "playerSpawned.sqf"}];
player addMPEventHandler ["mpkilled", {_this execVM "playerKilledServer.sqf"}];
	
_nil = execVM "initActions.sqf";
_nil = [] execVM "player_markers.sqf";
_nil = execVM "playerLoop.sqf";
_nil = execVM "playerSaveLoop.sqf";
waitUntil {alive player};
player addRating 99999999;
_nil = [] execVM "playerSpawned.sqf";
player_stats_got = 0;
[[player], "getPlayerStats", false, false] spawn BIS_fnc_MP;

[] execVM "scripts\zlt_civveh.sqf";

[
    5*60, // seconds to delete dead bodies (0 means don't delete) 
    15*60, // seconds to delete dead vehicles (0 means don't delete)
    15*60, // seconds to delete immobile vehicles (0 means don't delete)
    5*60, // seconds to delete dropped weapons (0 means don't delete)
    15*60, // seconds to deleted planted explosives (0 means don't delete)
    30*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'repetitive_cleanup.sqf';