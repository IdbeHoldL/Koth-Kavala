/*
	File: fn_playerTags.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private["_pos"];

{
	if(player distance _x < 2500 && isPlayer _x && _x != player && side _x isEqualto playerSide) then {
		if(!lineIntersects [eyePos player, eyePos _x,player, _x]) then {
			_pos = visiblePosition _x;
			_pos set[2,(getPosATL _x select 2) + 2.2];
			switch (playerSide) do {		
				case west : {drawIcon3D ["\a3\ui_f\data\map\Diary\Icons\playerwest_ca.paa",[1,1,1,1],_pos,1,1,0,(_x getVariable ["nametag",name _x]),0,0.04];};
				case east : {drawIcon3D ["\a3\ui_f\data\map\Diary\Icons\playereast_ca.paa",[1,1,1,1],_pos,1,1,0,(_x getVariable ["nametag",name _x]),0,0.04];};
				case independent : {drawIcon3D ["\a3\ui_f\data\map\Diary\Icons\playerguer_ca.paa",[1,1,1,1],_pos,1,1,0,(_x getVariable ["nametag",name _x]),0,0.04];};
			};
		};
	};
} foreach playableUnits;
 