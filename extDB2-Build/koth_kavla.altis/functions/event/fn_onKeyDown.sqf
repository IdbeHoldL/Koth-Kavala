/*
	File: fn_onKeyDown.sqf
	Author: BAROD
	
	Description:
		NONE
	Parameters:
		NONE
*/

private [ "_display", "_code", "_shift", "_ctrl", "_alt", "_handled" ];
_display = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_handled = false;

switch (true) do 
{
	case ( _code in actionKeys "ForceCommandingMode" );
	case ( _code in actionKeys "TacticalView" );
	case ( _code in actionKeys "SelectGroupUnit0" );
	case ( _code in actionKeys "SelectGroupUnit1" );
	case ( _code in actionKeys "SelectGroupUnit2" );
	case ( _code in actionKeys "SelectGroupUnit3" );
	case ( _code in actionKeys "SelectGroupUnit4" );
	case ( _code in actionKeys "SelectGroupUnit5" );
	case ( _code in actionKeys "SelectGroupUnit6" );
	case ( _code in actionKeys "SelectGroupUnit7" );
	case ( _code in actionKeys "SelectGroupUnit8" );
	case ( _code in actionKeys "SelectGroupUnit9" );
	case ( _code in actionKeys "GroupPagePrev" );
	case ( _code in actionKeys "GroupPageNext" );
	case ( _code in actionKeys "SelectAll" );
	case ( _code in actionKeys "CommandingMenu0" );
	case ( _code in actionKeys "CommandingMenu1" );
	case ( _code in actionKeys "CommandingMenu2" );
	case ( _code in actionKeys "CommandingMenu3" );
	case ( _code in actionKeys "CommandingMenu4" );
	case ( _code in actionKeys "CommandingMenu5" );
	case ( _code in actionKeys "CommandingMenu6" );
	case ( _code in actionKeys "CommandingMenu7" );
	case ( _code in actionKeys "CommandingMenu8" );
	case ( _code in actionKeys "CommandingMenu9" ): 
	{
		_handled = true;
	};
	
	case ( _code in actionKeys "PushToTalkSide" );
	case ( _code in actionKeys "PushToTalkAll" );
	case ( _code in actionKeys "PushToTalkDirect" );
	case ( _code in actionKeys "VoiceOverNet" );
	case ( _code in actionKeys "PushToTalk" ): 
	{
		if ( currentChannel isEqualto 1 ) then
        	{
        		  setCurrentChannel 5;
        	};
	};	


	case ( _code in actionKeys "ShowMap" ): {
		if !( visibleMap ) then {
			[] spawn KOTH_fnc_playerMarkers;
		};
	};
	case (_code in [199,219,220]): {
		KOTH_tagsOff = !KOTH_tagsOff;
		if (KOTH_tagsOff) then {
			KOTH_IdPlayerTags = ["KOTH_PlayerTags","onEachFrame","KOTH_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
		} else {
			[KOTH_IdPlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
		_handled = true;
	};
};

switch (_code) do {
		//ESC
	case 1: {	
		if( !alive player ) then {
				_handled = true;
		};		
	};

	//U
	case 22 : {
		([] call BIS_fnc_displayMission) createDisplay "RscDisplayDynamicGroups";
    };
	//F1
	case 59 : {
		KOTH_earplugsOff = !KOTH_earplugsOff;
		if (KOTH_earplugsOff) then {
			1 fadeSound 0.1; 
			0 = ["<t size = '0.8' shadow = '0' color = '#99ffffff'>You've inserted your earplugs.</t>", 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
		} else {
			1 fadeSound 1;
			0 = ["<t size = '0.8' shadow = '0' color = '#99ffffff'>You've taken out your earplugs.</t>", 0, 1, 5, 2, 0, 1] spawn bis_fnc_dynamictext;
		};
		_handled = true;
    };
	//H
	case 35: {
		if (currentweapon player != "") then{
			KOTH_HolsteredWep = currentweapon player;
			player action["switchWeapon", player, player, 100];
		} else {
			if (KOTH_HolsteredWep != "") then{
				player selectWeapon KOTH_HolsteredWep;
			};
		};	
	};
};

_handled;
