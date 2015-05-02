/*
	File: fn_onKilled.sqf
	Author: BAROD

	Description:
		Trigger when client Dies.

	Parameters:
		0: unit: Object
		1: killer: Object
*/

_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_txt = "";

if (isPlayer _victim && isPlayer _killer) then {
	if(_victim != _killer) then {
		if (_killer isKindOf "Man") then {
			if ((faction _victim) != (faction _killer)) then {
				if (isPlayer _killer) then {
					[100,0,1] call KOTH_fnc_playerLevel;
				};
									
				_distance = floor(_killer distance _victim);
				_killerWep = gettext((configFile >> "CfgWeapons" >> currentWeapon _killer) >> "picture");			
				
				_txt = format ["<t align='left' size='0.9'>%1 </t><img size='1.0' align='left' image='%2'/><t align='left' size='0.9'> %3 </t><t align='left' size='0.9'>[%4m]</t>",_killer getVariable ["nametag",name _killer],_killerWep,_victim getVariable ["nametag",name _victim],_distance];
			} else {
			
				//Team kill 
			
			};
		}
		else
		{
			if ((faction _victim) != (faction _killer)) then {
				if (isPlayer _killer) then {
					{
						[100,0,1] call KOTH_fnc_playerLevel;
					} forEach crew _killer;
				};
					
				_distance = floor(_killer distance _victim);
				_killerVeh  = getText(configFile >> "CfgVehicles" >> (typeOf vehicle _killer) >> "picture");
			
				_txt = format ["<t align='left' size='0.9'>%1 </t><img size='1.0' align='left' image='%2'/><t align='left' size='0.9'> %3 </t><t align='left' size='0.9'>[%4m]</t>",_killer getVariable ["nametag",name _killer],_killerVeh,_victim getVariable ["nametag",name _victim],_distance];
			} else {
			
				//Team kill 
			
			};
		};
	};
}; 

if (_txt != "") then {
	[[_txt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],30,0.5],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
};